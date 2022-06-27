import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:otus_food_app/constants.dart';

Widget logoWidget() {
  var name = Constants.logoIMAGE;

  return MaskedImage(
    imageSrc: name,
    child: const SizedBox(
      width: 258,
      height: 168,
      child: Text(
        "OTUS FOOD",
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Roboto',
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w900,
          height: 0.95,
          fontSize: 95.0,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

class MaskedImage extends StatelessWidget {
  final String imageSrc;
  final Widget child;

  const MaskedImage({Key? key, required this.imageSrc, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) => FutureBuilder<ui.Image>(
        future: getUiImage(imageSrc, 175, 250),
        builder: (context, snap) => snap.hasData
            ? ShaderMask(
                blendMode: BlendMode.srcATop,
                shaderCallback: (bounds) => ui.ImageShader(
                      snap.data!,
                      ui.TileMode.decal,
                      ui.TileMode.decal,
                      Matrix4.identity().storage,
                    ),
                child: child)
            : Container(),
      );

  // Future<ui.Image> loadImage() async {
  //   final completer = Completer<ui.Image>();
  //   final stream = image.resolve(ImageConfiguration());
  //   stream.addListener(
  //       ImageStreamListener((info, _) => completer.complete(info.image)));
  //   return completer.future;
  // }

  Future<ui.Image> getUiImage(
      String imageAssetPath, int height, int width) async {
    final ByteData assetImageByteData = await rootBundle.load(imageAssetPath);
    final codec = await ui.instantiateImageCodec(
      assetImageByteData.buffer.asUint8List(),
      targetHeight: height,
      targetWidth: width,
    );
    final image = (await codec.getNextFrame()).image;
    return image;
  }
}
