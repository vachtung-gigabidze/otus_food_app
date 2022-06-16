import 'dart:async';
import 'dart:typed_data';

import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class LogoScreen extends StatelessWidget {
  const LogoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var matrix42 = matrix4;
    Float64List matrix4 = new Matrix4.identity().storage;
    return MaterialApp(
      title: 'Otus Food App',
      theme: ThemeData(
        canvasColor: Colors.green[900],
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.green[900],
          secondary: Colors.green,
          background: Colors.green[900],
        ),
        textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.purple)),
      ),
      home: Scaffold(
          body: Center(
              child: MaskedImage(
        image: Image.asset('assets/images/logo.png').image,
        child: Text(
          'OTUS FOOD',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 165,
          ),
        ),
      ))),
    );
  }
}

class MaskedImage extends StatelessWidget {
  final ImageProvider image;
  final Widget child;

  const MaskedImage({Key? key, required this.image, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) => FutureBuilder<ui.Image>(
        future: loadImage(),
        builder: (context, snap) => snap.hasData
            ? ShaderMask(
                blendMode: BlendMode.dstATop,
                shaderCallback: (bounds) => ui.ImageShader(
                      snap.data!,
                      ui.TileMode.clamp,
                      ui.TileMode.clamp,
                      Matrix4.identity().storage,
                    ),
                child: child)
            : Container(),
      );

  Future<ui.Image> loadImage() async {
    final completer = Completer<ui.Image>();
    final stream = image.resolve(ImageConfiguration());
    stream.addListener(
        ImageStreamListener((info, _) => completer.complete(info.image)));
    return completer.future;
  }
}
