import 'dart:io';

import 'package:flutter/foundation.dart' as f;
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:otus_food_app/models/Photo.dart';
import 'package:otus_food_app/utils/db_helper.dart';
import 'package:otus_food_app/utils/gallery_utils.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tflite/tflite.dart';
import 'package:flutter/services.dart' show rootBundle;
// import 'package:otus_food_app/utils/tensorflow/classifier.dart';
// import 'package:otus_food_app/utils/tensorflow/classifier_quant.dart';
// import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';

class SaveImageSQLite extends StatefulWidget {
  final int? recipeId;
  //
  SaveImageSQLite({this.recipeId, super.key});

  final String title = "Галерея рецепта";

  @override
  _SaveImageSQLiteState createState() => _SaveImageSQLiteState();
}

class _SaveImageSQLiteState extends State<SaveImageSQLite> {
  //
  // Future<File>? imageFile;
  // Image? image;
  late DBHelper dbHelper;
  late List<Photo> images;
  // late Classifier _classifier;

  XFile? _image;

  late List _result;
  late String _Confid = "";
  String _name = '';
  String _number = '';

  // Category? category;

  @override
  void initState() {
    super.initState();
    images = [];
    dbHelper = DBHelper();
    refreshImages();
    loadImageModel();
    // _classifier = ClassifierQuant();
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
    ImagePicker().pickImage(source: ImageSource.gallery).then((imgFile) {
      _image = imgFile;
      Future<f.Uint8List> u8 = imgFile!.readAsBytes();
      u8.then((value) {
        String imgString = Utility.base64String(value);
        Photo photo = Photo(0, imgString, widget.recipeId!);
        dbHelper.save(photo);
        refreshImages();
      });
    });
  }

  gridView() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: images.map((photo) {
          Image img = Utility.imageFromBase64String(photo.photo_name);

          return GestureDetector(
              //onTap: applyImageModel(img.),
              child: img);
        }).toList(),
      ),
    );
  }

  // void _predict() async {
  //   img.Image imageInput = img.decodeImage(_image!.readAsBytesSync())!;
  //   var pred = _classifier.predict(imageInput);

  //   setState(() {
  //     this.category = pred;
  //   });
  // }

  loadImageModel() async {
    var result = await Tflite.loadModel(
        labels: 'assets/tensorflow/labels.txt',
        model: 'assets/tensorflow/model_unquant.tflite');
    print("Result is $result");
  }

  applyImageModel(String path) async {
    var res = await Tflite.runModelOnImage(
      path: path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
    );

    setState(() {
      _result = res!;
    });

    String str = _result[0]["label"];
    _name = str.substring(2);
    _Confid = _result != null
        ? (_result[0]['confidence'] * 100.0).toString().substring(0, 2) + '%'
        : "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              pickImageFromGallery();
            },
          ),
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () async {
              Directory directory = await getApplicationDocumentsDirectory();
              print('${directory.path}/assets/images/1_full.png');
              applyImageModel('${directory.path}/assets/images/1_full.png');
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset('assets/images/1_full.png'),
            // Image.file(File('.../assets/images/1_full.png')),
            Text('$_Confid'),
            Text('$_name'),
            Flexible(
              child: gridView(),
            )
          ],
        ),
      ),
    );
  }
}
