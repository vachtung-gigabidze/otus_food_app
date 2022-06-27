import 'package:flutter/material.dart';
import 'package:otus_food_app/constants.dart';

class CommentPost extends StatefulWidget {
  const CommentPost({Key? key}) : super(key: key);

  @override
  State<CommentPost> createState() => _CommentPostState();
}

class _CommentPostState extends State<CommentPost> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.0,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        border: Border.all(
            color: const Color(0xFF165932),
            width: 2.0,
            style: BorderStyle.solid),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term',
                ),
              ),
            ),
            // TextField(

            //   decoration: InputDecoration.collapsed(
            //     hintText: 'оставить комментарий',
            //   ),
            // ),
            Image(
              image: AssetImage(Constants.imageIcon),
              height: 19,
              width: 24,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
