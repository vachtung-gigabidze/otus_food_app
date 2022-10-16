import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/models/recipe_model.dart';

class CommentPost extends StatefulWidget {
  const CommentPost({Key? key, required this.addComment}) : super(key: key);
  final Function(Comment) addComment;

  @override
  State<CommentPost> createState() => _CommentPostState();
}

class _CommentPostState extends State<CommentPost> {
  late TextEditingController _controllerTextComment;
  late XFile? _newImageComment;
  @override
  void initState() {
    _newImageComment = null;
    _controllerTextComment = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _controllerTextComment.dispose();
    super.dispose();
  }

  final ImagePicker _picker = ImagePicker();

  _imgFromCamera() async {
    XFile? image = await _picker.pickImage(source: ImageSource.camera);

    setState(() {
      _newImageComment = image;
    });
  }

  _imgFromGallery() async {
    XFile? image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _newImageComment = image;
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Галерея'),
                    onTap: () {
                      _imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Камера'),
                  onTap: () {
                    _imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 72,
          child: TextField(
            controller: _controllerTextComment,
            onEditingComplete: () {
              if (_controllerTextComment.text.isNotEmpty) {
                DateTime today = DateTime.now();
                widget.addComment(Comment(
                    user: User(),
                    text: _controllerTextComment.text,
                    datetime:
                        '${today.day < 10 ? 0 : ''}${today.day}.${today.month < 10 ? 0 : ''}${today.month}.${today.year}',
                    photo: _newImageComment?.path ?? ""));
                _newImageComment = null;
                _controllerTextComment.clear();
              }
              FocusScope.of(context).previousFocus();
            },
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                  onTap: () {
                    _showPicker(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    color: Colors.transparent,
                    constraints: const BoxConstraints(
                      maxHeight: 24.0,
                      maxWidth: 24.0,
                    ),
                    child: _newImageComment != null
                        ? Image.file(
                            File(_newImageComment!.path),
                            width: 24,
                            height: 19.2,
                            fit: BoxFit.fitHeight,
                          )
                        : const Image(
                            image: AssetImage(
                              Constants.imageIcon,
                            ),
                            height: 24,
                            width: 19.2,
                          ),
                  )),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                color: Color(0xFF165932),
                width: 2,
                style: BorderStyle.solid,
              )),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                color: Color(0xFF165932),
                width: 2,
                style: BorderStyle.solid,
              )),
              hintText: 'оставить комментарий',
              hintStyle: const TextStyle(
                height: 2.0,
                fontFamily: 'Roboto',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
                color: Color(0xFFC2C2C2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
