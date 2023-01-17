import 'dart:convert';

import 'package:image/image.dart' as img;
import 'package:flutter/foundation.dart';
import 'package:tflite/tflite.dart';

class TfliteIsolate {
  @pragma('vm:entry-point')
  static Future<dynamic> runModelOnBinary(List<dynamic> args) async {
    try {
      final binary = args[0] as Uint8List;
      final labels = args[1] as String;
      final model = args[2] as String;

      await Tflite.loadModel(labels: labels, model: model);

      img.Image? oriImage = img.decodeImage(binary.buffer.asUint8List());
      img.Image? resizedImage =
          img.copyResize(oriImage!, height: 224, width: 224);

      final output = await Tflite.runModelOnBinary(
        binary: imageToByteListFloat32(resizedImage, 224, 127.5, 127.5),
        numResults: 1,
        threshold: 0.05,
      );

      return json.encode(output![0]);
    } catch (e) {
      return "Не распознал фото";
    }
  }

  static Uint8List imageToByteListFloat32(
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
}
