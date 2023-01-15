import 'dart:convert';
import 'dart:isolate';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class TfliteIsolate {
  static final TfliteIsolate _singleton = TfliteIsolate._internal();

  SendPort? _sendPort;
  Isolate? _isolate;

  TfliteIsolate._internal();

  factory TfliteIsolate() {
    return _singleton;
  }

  Future<dynamic> detectImage(XFile image) async {
    if (_isolate == null || _sendPort == null) {
      await _makeIsolate();
    }
    return _sendReceive(_sendPort!, image);
  }

  Future<void> startIsolate() {
    return _makeIsolate();
  }

  void dispose() {
    Tflite.close();
    _isolate?.kill();
    _isolate = null;
    _sendPort = null;
  }

  Future<void> _makeIsolate() async {
    await Tflite.loadModel(
        labels: 'assets/tensorflow/labels.txt',
        model: 'assets/tensorflow/model_unquant.tflite');

    final receivePort = ReceivePort();
    _isolate = await Isolate.spawn(
      _isolateDetect,
      receivePort.sendPort,
      debugName: 'tflite_isolate',
    );
    _sendPort = await receivePort.first;
    receivePort.close();
  }

  Future<dynamic> _sendReceive(SendPort port, XFile image) async {
    final response = ReceivePort();
    port.send([image, response.sendPort]);
    dynamic detected = await response.first;
    response.close();
    return detected;
  }

  void _isolateDetect(SendPort sendPort) async {
    final receivePort = ReceivePort();
    sendPort.send(receivePort.sendPort);

    await for (List msg in receivePort) {
      XFile image = msg[0];

      final SendPort replyTo = msg[1];

      dynamic data;
      if (image != null) {
        data = _runModelOnImage(image);
      } else {
        throw 'Invalid State';
      }

      replyTo.send(data);
    }
  }

// Future<String> _runModelOnImage(XFile image) async {
  Future<dynamic> _runModelOnImage(XFile image) async {
    // var recognitions = await Tflite.runModelOnBinary(
    //     binary: imageToByteListFloat32(image, 224, 127.5, 127.5), // required
    //     numResults: 6, // defaults to 5
    //     threshold: 0.05, // defaults to 0.1
    //     asynch: true // defaults to true
    //     );

    try {
      List<dynamic>? output = await Tflite.runModelOnImage(
          path: image.path,
          numResults: 1,
          threshold: 0.5,
          imageMean: 127.5,
          imageStd: 127.5,
          asynch: false);
      return output?[0].toJson();
    } catch (e) {
      return "Не распознал фото";
    }

    // return output!.isNotEmpty
    //     ? '${output[0]['label'].substring(2)} (${(output[0]['confidence'] * 100.0).toString().substring(0, 2)}%)'
    //     : "Не распознал фото";
  }

  Uint8List imageToByteListFloat32(
      img.Image image, int inputSize, double mean, double std) {
    var convertedBytes = Float32List(1 * inputSize * inputSize * 3);
    var buffer = Float32List.view(convertedBytes.buffer);
    int pixelIndex = 0;
    for (var i = 0; i < inputSize; i++) {
      for (var j = 0; j < inputSize; j++) {
        var pixel = image.getPixel(j, i);
        buffer[pixelIndex++] = (img.getRed(pixel) - mean) / std;
        buffer[pixelIndex++] = (img.getGreen(pixel) - mean) / std;
        buffer[pixelIndex++] = (img.getBlue(pixel) - mean) / std;
      }
    }
    return convertedBytes.buffer.asUint8List();
  }

  Uint8List imageToByteListUint8(img.Image image, int inputSize) {
    var convertedBytes = Uint8List(1 * inputSize * inputSize * 3);
    var buffer = Uint8List.view(convertedBytes.buffer);
    int pixelIndex = 0;
    for (var i = 0; i < inputSize; i++) {
      for (var j = 0; j < inputSize; j++) {
        var pixel = image.getPixel(j, i);
        buffer[pixelIndex++] = img.getRed(pixel);
        buffer[pixelIndex++] = img.getGreen(pixel);
        buffer[pixelIndex++] = img.getBlue(pixel);
      }
    }
    return convertedBytes.buffer.asUint8List();
  }
}
