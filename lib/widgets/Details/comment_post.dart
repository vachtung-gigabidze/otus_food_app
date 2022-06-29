import 'package:flutter/material.dart';
import 'package:otus_food_app/constants.dart';

class CommentPost extends StatefulWidget {
  const CommentPost({Key? key}) : super(key: key);

  @override
  State<CommentPost> createState() => _CommentPostState();
}

class _CommentPostState extends State<CommentPost> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 72,
          child: TextField(
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    color: Colors.transparent,
                    constraints: const BoxConstraints(
                      maxHeight: 24.0,
                      maxWidth: 24.0,
                    ),
                    child: const Image(
                      image: AssetImage(
                        Constants.imageIcon,
                      ),
                      height: 24,
                      width: 24,
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
