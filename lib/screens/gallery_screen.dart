import 'package:flutter/foundation.dart' as f;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:otus_food_app/app/domain/error_entity/error_entity.dart';
import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/models/photo_entity.dart';
import 'package:otus_food_app/utils/db_helper.dart';
import 'package:otus_food_app/widgets/status_style.dart';
import 'package:tflite/tflite.dart';

class SaveImageSQLite extends StatefulWidget {
  final int? recipeId;
  const SaveImageSQLite({this.recipeId, super.key});
  final String title = "Галерея рецепта";

  @override
  _SaveImageSQLiteState createState() => _SaveImageSQLiteState();
}

class _SaveImageSQLiteState extends State<SaveImageSQLite> {
  late DBHelper dbHelper;
  late List<Photo> images;
  XFile? _image;
  dynamic _pickImageError;

  loadModel() async {
    await Tflite.loadModel(
        labels: 'assets/tensorflow/labels.txt',
        model: 'assets/tensorflow/model_unquant.tflite');
  }

  @override
  void initState() {
    super.initState();
    images = [];
    dbHelper = DBHelper();
    refreshImages();
    loadModel();
  }

  @override
  void dispose() {
    super.dispose();
  }

  refreshImages() {
    dbHelper.getPhotos(widget.recipeId!).then((photo) {
      setState(() {
        images.clear();
        images.addAll(photo);
      });
    });
  }

  pickImageFromGallery() {
    pickImage(ImageSource.gallery);
  }

  pickImage(ImageSource imageSource) {
    try {
      ImagePicker()
          .pickImage(source: imageSource, maxHeight: 600, maxWidth: 800)
          .then((imgFile) {
        if (imgFile == null) {
          return;
        }

        _image = imgFile;
        Future<f.Uint8List> u8 = imgFile.readAsBytes();
        u8.then((value) async {
          var detectedInfo = await detectImage(_image!);
          Photo photo =
              Photo(0, imgFile.name, widget.recipeId!, detectedInfo, value);
          dbHelper.save(photo);
          refreshImages();
        });
      });
    } catch (e) {
      _showSnackBar(context, ErrorEntity.fromException(e));
    }
  }

  pickImageFromCamera() {
    pickImage(ImageSource.camera);
  }

  deletePhoto(Photo photo) {
    dbHelper.delete(photo);
    refreshImages();
  }

  Future<String> detectImage(XFile image) async {
    List<dynamic>? output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 1,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    // print(output);
    return output!.isNotEmpty
        ? '${output[0]['label'].substring(2)} (${(output[0]['confidence'] * 100.0).toString().substring(0, 2)}%)'
        : "Не распознал фото";
  }

  gridView() {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: images.map((photo) {
          //Image img = Utility.imageFromBase64String(photo.pict);
          return Stack(children: [
            Column(
              children: [
                SizedBox(
                  width: width / 3,
                  child: Image.memory(photo.pict),
                ),
                Text(
                  photo.detectedInfo,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
            Positioned(
              top: 10,
              left: -10,
              child: IconButton(
                onPressed: () {
                  deletePhoto(photo);
                },
                icon: const Icon(
                  Icons.delete_forever,
                  size: 24,
                  color: AppColors.main,
                ),
              ),
            )
          ]);
        }).toList(),
      ),
    );
  }

  void _showSnackBar(BuildContext context, ErrorEntity error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 5),
        content: SingleChildScrollView(
          child: Text(maxLines: 5, error.show()),
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: StatusOverlay.green,
        backgroundColor: AppColors.accent,
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.image),
            onPressed: () {
              pickImageFromGallery();
            },
          ),
          IconButton(
            icon: const Icon(Icons.camera),
            onPressed: () {
              pickImageFromCamera();
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: gridView(),
            )
          ],
        ),
      ),
    );
  }
}
