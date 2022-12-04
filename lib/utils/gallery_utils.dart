// import 'dart:io';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:otus_food_app/models/photo_entity.dart';
// import 'dart:async';
import 'dart:convert';

import 'package:path_provider/path_provider.dart';

class Utility {
  static Image imageFromBase64String(String base64String) {
    return Image.memory(
      base64Decode(base64String),
      fit: BoxFit.fill,
    );
  }

  static Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

  static String base64String(Uint8List data) {
    return base64Encode(data);
  }

  pickImageFromGallery() async {
    await ImagePicker()
        .pickImage(source: ImageSource.gallery)
        .then((imgFile) async {
      String imgString = Utility.base64String(await imgFile!.readAsBytes());
      return imgString;
    });
  }

//   void compressPhoto(String srcPath, String compressPath) {
//   final input = ImageFile(
//     rawBytes: File(srcPath).readAsBytesSync(),
//     filePath: srcPath,
//   );
//   final output = compress(ImageFileConfiguration(input: input));
//   File(compressPath).writeAsBytesSync(output.rawBytes);
// }

// Future createPhotoData(String srcPath) async {
//   var extDir = await getApplicationDocumentsDirectory();
//   var compressDir = await Directory('${extDir.path}/Thumbnail/').create();
//   var compressPath = compressDir.path + srcPath.split('/').last;

//   compressPhoto(srcPath, compressPath);

//   var nowTime = DateTime.now().toString();
//   Photo photo = Photo(srcPath, compressPath, nowTime, nowTime);
//   DatabaseHelper.to.savePhoto(photo);
// }

// Future updatePhotoData(Photo photo) async {
//   compressPhoto(photo.srcPath, photo.thumbPath);

//   photo.modifyDate = DateTime.now().toString();
//   DatabaseHelper.to.updatePhoto(photo);
// }

// Future deletePhotoData(Photo photo) async {
//   File(photo.srcPath).deleteSync();
//   File(photo.thumbPath).deleteSync();
//   DatabaseHelper.to.deletePhoto(photo.id);
// }

// Future checkNotInDBPhotos() async {
//   var extDir = await getApplicationDocumentsDirectory();
//   var srcDir = await Directory('${extDir.path}/Pictures').create();
//   var srcFiles = srcDir.listSync();

//   for (var file in srcFiles) {
//     if (!await DatabaseHelper.to.isInDatabase(file.path)) {
//       var compressDir = await Directory('${extDir.path}/Thumbnail/').create();
//       var compressPath = compressDir.path + file.path.split('/').last;

//       compressPhoto(file.path, compressPath);

//       var nowTime = DateTime.now().toString();
//       Photo photo = Photo(file.path, compressPath, nowTime, nowTime);
//       DatabaseHelper.to.savePhoto(photo);
//     }
//   }
}
