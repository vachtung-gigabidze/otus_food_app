import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:otus_food_app/models/Photo.dart';
import 'package:otus_food_app/utils/db_helper.dart';
import 'package:otus_food_app/utils/gallery_utils.dart';

class SaveImageDemoSQLite extends StatefulWidget {
  final int? recipeId;
  //
  SaveImageDemoSQLite({this.recipeId, super.key});

  final String title = "Галерея рецепта";

  @override
  _SaveImageDemoSQLiteState createState() => _SaveImageDemoSQLiteState();
}

class _SaveImageDemoSQLiteState extends State<SaveImageDemoSQLite> {
  //
  Future<File>? imageFile;
  Image? image;
  late DBHelper dbHelper;
  late List<Photo> images;

  @override
  void initState() {
    super.initState();
    images = [];
    dbHelper = DBHelper();
    refreshImages();
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
    ImagePicker().pickImage(source: ImageSource.gallery).then((imgFile) {
      Future<Uint8List> u8 = imgFile!.readAsBytes();
      u8.then((value) {
        String imgString = Utility.base64String(value);
        Photo photo = Photo(0, imgString, widget.recipeId!);
        dbHelper.save(photo);
        refreshImages();
      });
    });
  }

  gridView() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: images.map((photo) {
          return Utility.imageFromBase64String(photo.photo_name);
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              pickImageFromGallery();
            },
          )
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
