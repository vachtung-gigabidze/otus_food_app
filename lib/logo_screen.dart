import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';

import 'package:flutter/material.dart';

class LogoScreen extends StatelessWidget {
  const LogoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var name = 'assets/images/logo.png';
    return MaterialApp(
      title: 'Otus Food App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.purple)),
      ),
      home: Scaffold(
          body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.0, 0.0),
              end: Alignment(0.308, 0.951),
              colors: <Color>[
                Color(0xFF2ECC71),
                Color(0xFF165932),
                //Color(0x2ECC71),
                //Color(0x165932),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image(image: Image.asset(name).image),
              Center(
                child: MaskedImage(
                  imageSrc: name,
                  child: SizedBox(
                    width: 258,
                    height: 168,
                    child: Text(
                      "OTUS FOOD",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w900,
                        height: 0.95,
                        fontSize: 95.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class MaskedImage extends StatelessWidget {
  final String imageSrc;
  final Widget child;

  MaskedImage({Key? key, required this.imageSrc, required this.child})
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
