import 'dart:io';

import 'package:flutter/foundation.dart' as f;
import 'package:flutter/material.dart';
import 'package:flutter_isolate/flutter_isolate.dart';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:otus_food_app/app/domain/error_entity/error_entity.dart';
import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/models/photo_entity.dart';
import 'package:otus_food_app/utils/db_helper.dart';
import 'package:otus_food_app/utils/tflite_isolate.dart';
import 'package:otus_food_app/widgets/status_style.dart';

class SaveImageSQLite extends StatefulWidget {
  final int? recipeId;
  const SaveImageSQLite({this.recipeId, super.key});
  final String title = "Галерея рецепта";

  @override
  SaveImageSQLiteState createState() => SaveImageSQLiteState();
}

class SaveImageSQLiteState extends State<SaveImageSQLite> {
  late DBHelper dbHelper;
  late List<Photo> images;
  XFile? _image;
  // dynamic _pickImageError;

  @override
  void initState() {
    super.initState();
    images = [];
    dbHelper = DBHelper();
    refreshImages();

    //TfliteIsolate().startIsolate;
    //loadModel(); //init isolate
  }

  @override
  void dispose() {
    //TfliteIsolate().dispose();
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

  pickImage(ImageSource imageSource) async {
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
          //var detectedInfo = await detectImage(_image!);
          //var b = await imageToByteListFloat32(_image!, 224, 127.5, 127.5);
          //int? detectedInfo = await flutterCompute(expensiveWork, 1);
          final detectedInfo = await flutterCompute(
              TfliteIsolate.detectBinary, await xFileToByteListInt8(_image!));
          // final detectedInfo = await flutterCompute(TfliteIsolate.detectImage, _image!.path);
          // final detectedInfo = await TfliteIsolate().detectImage(value);
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

  Future<Uint8List> xFileToByteListInt8(XFile image) async {
    final bytes = await File(image.path).readAsBytes();
    // var convertedBytes = await image.readAsBytes();
    return bytes; //convertedBytes.buffer.asUint8List();
    // var convertedBytes = Float32List(1 * inputSize * inputSize * 3);
    // var buffer = Float32List.view(convertedBytes.buffer);
    // int pixelIndex = 0;
    // for (var i = 0; i < inputSize; i++) {
    //   for (var j = 0; j < inputSize; j++) {
    //     var pixel = image.getPixel(j, i);
    //     buffer[pixelIndex++] = (img.getRed(pixel) - mean) / std;
    //     buffer[pixelIndex++] = (img.getGreen(pixel) - mean) / std;
    //     buffer[pixelIndex++] = (img.getBlue(pixel) - mean) / std;
    //   }
    // }
    // return convertedBytes.buffer.asUint8List();
  }

  // Uint8List imageToByteListUint8(img.Image image, int inputSize) {
  //   var convertedBytes = Uint8List(1 * inputSize * inputSize * 3);
  //   var buffer = Uint8List.view(convertedBytes.buffer);
  //   int pixelIndex = 0;
  //   for (var i = 0; i < inputSize; i++) {
  //     for (var j = 0; j < inputSize; j++) {
  //       var pixel = image.getPixel(j, i);
  //       buffer[pixelIndex++] = img.getRed(pixel);
  //       buffer[pixelIndex++] = img.getGreen(pixel);
  //       buffer[pixelIndex++] = img.getBlue(pixel);
  //     }
  //   }
  //   return convertedBytes.buffer.asUint8List();
  // }

  pickImageFromCamera() {
    pickImage(ImageSource.camera);
  }

  deletePhoto(Photo photo) {
    dbHelper.delete(photo);
    refreshImages();
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
