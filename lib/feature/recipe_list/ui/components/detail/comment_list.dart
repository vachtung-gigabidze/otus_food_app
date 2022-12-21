import 'package:flutter/material.dart';
import 'package:otus_food_app/feature/recipe_list/domain/entities/recipe_entity.dart';
import 'package:otus_food_app/feature/recipe_list/ui/components/detail/comment_view.dart';

class CommentList extends StatelessWidget {
  const CommentList({Key? key, this.comments}) : super(key: key);

  final List<Comment>? comments;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: comments?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            child: CommentView(comment: comments?[index]),
          );
        });
  }
}
