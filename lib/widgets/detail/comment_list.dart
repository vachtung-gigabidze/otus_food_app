import 'package:flutter/material.dart';
import 'package:otus_food_app/models/recipe_model.dart';
// import 'package:otus_food_app/model.dart';
import 'package:otus_food_app/widgets/detail/comment_view.dart';

class CommentList extends StatelessWidget {
  const CommentList({Key? key, this.comments}) : super(key: key);

  final List<Comment>? comments;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        //padding: const EdgeInsets.all(8),

        itemCount: comments?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: CommentView(comment: comments?[index]),
          );
        });
  }
}
