// import 'dart:isolate';
// import 'dart:typed_data';
// import 'package:image/image.dart' as img;
// import 'package:image_picker/image_picker.dart';
// import 'package:flutter/material.dart';
import 'package:tflite/tflite.dart';

class TfliteIsolate {
  // static final TfliteIsolate _singleton = TfliteIsolate._internal();

  // SendPort? _sendPort;
  // Isolate? _isolate;

  // TfliteIsolate._internal();

  // factory TfliteIsolate() {
  //   return _singleton;
  // }

  // @pragma('vm:entry-point')
  // Future<dynamic> detectImage(Uint8List image) async {
  //   if (_isolate == null || _sendPort == null) {
  //     await _makeIsolate();
  //   }
  //   return _sendReceive(_sendPort!, image);
  // }

  // Future<void> startIsolate() {
  //   return _makeIsolate();
  // }

  // void dispose() {
  //   Tflite.close();
  //   _isolate?.kill();
  //   _isolate = null;
  //   _sendPort = null;
  // }

  // Future<void> _makeIsolate() async {
  //   final receivePort = ReceivePort();
  //   _isolate = await Isolate.spawn(
  //     _isolateDetect,
  //     receivePort.sendPort,
  //     debugName: 'tflite_isolate',
  //   );
  //   _sendPort = await receivePort.first;
  //   receivePort.close();
  // }

  // Future<dynamic> _sendReceive(SendPort port, Uint8List image) async {
  //   final response = ReceivePort();
  //   port.send([image, response.sendPort]);
  //   dynamic detected = await response.first;
  //   response.close();
  //   return detected;
  // }

  // void _isolateDetect(SendPort sendPort) async {
  //   final receivePort = ReceivePort();
  //   sendPort.send(receivePort.sendPort);

  //   await for (List msg in receivePort) {
  //     Uint8List image = msg[0];

  //     final SendPort replyTo = msg[1];

  //     dynamic data;
  //     if (image != null) {
  //       data = _runModelOnImage(image);
  //     } else {
  //       throw 'Invalid State';
  //     }

  //     replyTo.send(data);
  //   }
  // }

  // loadModel() async {
  //   await Tflite.loadModel(
  //       labels: 'assets/tensorflow/labels.txt',
  //       model: 'assets/tensorflow/model_unquant.tflite');
  // }

  @pragma('vm:entry-point')
  static Future<String> detectImage(String image) async {
    // Future<String> detectImage(Uint8List image) async {
    final res = await Tflite.loadModel(
        labels: 'assets/tensorflow/labels.txt',
        model: 'assets/tensorflow/model_unquant.tflite');

    List<dynamic>? output = await Tflite.runModelOnImage(
      path: image,
      numResults: 1,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    // final output = await Tflite.runModelOnBinary(

    //   binary: image,
    //   numResults: 1,
    //   threshold: 0.5,
    //   asynch: true,
    // );

    return output!.isNotEmpty
        ? '${output[0]['label'].substring(2)} (${(output[0]['confidence'] * 100.0).toString().substring(0, 2)}%)'
        : "Не распознал фото";
  }

  // static Future<dynamic> runModelOnImage(Uint8List image) async {
  //   WidgetsFlutterBinding.ensureInitialized;

  //   try {
  //     final res = await Tflite.loadModel(
  //         labels: 'assets/tensorflow/labels.txt',
  //         model: 'assets/tensorflow/model_unquant.tflite');

  //     List<dynamic>? output = await Tflite.runModelOnBinary(
  //       binary: image,
  //       numResults: 1,
  //       threshold: 0.5,
  //     );
  //     return output?[0].toJson();
  //   } catch (e) {
  //     return "Не распознал фото";
  //   }
  // }

// Future<String> _runModelOnImage(XFile image) async {
  // Future<dynamic> _runModelOnImage(Uint8List image) async {
  //   WidgetsFlutterBinding.ensureInitialized;
  //   // var recognitions = await Tflite.runModelOnBinary(
  //   //     binary: imageToByteListFloat32(image, 224, 127.5, 127.5), // required
  //   //     numResults: 6, // defaults to 5
  //   //     threshold: 0.05, // defaults to 0.1
  //   //     );

  //   try {
  //     await Tflite.loadModel(
  //         labels: 'assets/tensorflow/labels.txt',
  //         model: 'assets/tensorflow/model_unquant.tflite');
  //     //List<dynamic>? output = await Tflite.runModelOnImage(
  //     // var b = await imageToByteListFloat32(image, 224, 127.5, 127.5);
  //     List<dynamic>? output = await Tflite.runModelOnBinary(
  //       binary: image,
  //       // path: image.path,
  //       numResults: 1,
  //       threshold: 0.5,
  //       // imageMean: 127.5,
  //       // imageStd: 127.5
  //     );
  //     return output?[0].toJson();
  //   } catch (e) {
  //     return "Не распознал фото";
  //   }

  //   // return output!.isNotEmpty
  //   //     ? '${output[0]['label'].substring(2)} (${(output[0]['confidence'] * 100.0).toString().substring(0, 2)}%)'
  //   //     : "Не распознал фото";
  // }
}
