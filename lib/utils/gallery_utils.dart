import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

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
}

class TfliteDto {
  double? confidence;
  int? index;
  String? label;

  TfliteDto({this.confidence, this.index, this.label});

  TfliteDto.fromJson(Map<String, dynamic> json) {
    confidence = json['confidence'];
    index = json['index'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['confidence'] = confidence;
    data['index'] = index;
    data['label'] = label;
    return data;
  }

  @override
  String toString() {
    return '$label (${(confidence! * 100.0).toString().substring(0, 2)}%)';
  }
}
