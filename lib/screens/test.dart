import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class TestTensorFlow extends StatefulWidget {
  @override
  _TestTensorFlowState createState() => _TestTensorFlowState();
}

class _TestTensorFlowState extends State<TestTensorFlow> {
  bool _isLoading = true;
  File _image = File("");
  List _output = [];
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  detectImage(File image) async {
    print('Загрузка ${image.path}');
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.6,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    print(output);
    setState(() {
      // _output.add(output);
      _output = output!;
      _isLoading = false;
    });
    //output!.isNotEmpty ? output.clear() : null;
  }

  loadModel() async {
    await Tflite.loadModel(
        labels: 'assets/tensorflow/labels.txt',
        model: 'assets/tensorflow/model_unquant.tflite');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  pickImage() async {
    var image = await picker.getImage(source: ImageSource.camera);
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });

    detectImage(_image);
  }

  pickGalleryImage() async {
    var image = await picker.getImage(source: ImageSource.gallery);
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });

    detectImage(_image);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[400],
        body: Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Text(
                    'Cats and Dogs Detector app',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  ),
                ),
                SizedBox(height: 200.0),
                Center(
                  child: _isLoading
                      ? Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/1_full.png",
                                fit: BoxFit.cover,
                              )
                            ],
                          ),
                        )
                      : Container(
                          child: Column(
                            children: [
                              Container(
                                height: 250,
                                child: Image.file(_image),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              _output != null
                                  ? Text(
                                      _output.isNotEmpty
                                          ? '${_output[0]['label']}'
                                          : "Пусто",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15.0),
                                    )
                                  : Container(),
                              SizedBox(
                                height: 10.0,
                              ),
                            ],
                          ),
                        ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            pickImage();
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.grey),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15.0),
                            child: Text(
                              'Capture a pic',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.5,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            pickGalleryImage();
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.grey),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 15.0),
                            child: Text(
                              'Select from gallery',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.50,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
