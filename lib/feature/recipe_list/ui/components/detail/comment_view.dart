import 'dart:io';
import 'package:flutter/material.dart';
import 'package:otus_food_app/feature/recipe_list/domain/entities/recipe_entity.dart';
import 'package:intl/intl.dart';

class CommentView extends StatelessWidget {
  const CommentView({Key? key, this.comment}) : super(key: key);
  final Comment? comment;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(31.5),
          child: comment?.user?.photo != null
              ? Image(
                  image: AssetImage(comment?.user?.photo ?? ""),
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 63,
                      width: 63,
                      color: Colors.grey,
                    );
                  },
                  fit: BoxFit.cover,
                  height: 63,
                  width: 63,
                )
              : Container(
                  height: 63,
                  width: 63,
                  color: Colors.grey,
                ),
        ),
        const SizedBox(
          width: 18,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    comment?.user?.login ?? "",
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0,
                      color: Color(0xFF2ECC71),
                    ),
                  ),
                  Text(
                    DateFormat('dd-MM-yyyy')
                        .format(DateTime.parse(comment?.datetime ?? ""))
                        .toString(),
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                      color: Color(0xFFC2C2C2),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      comment?.text ?? '',
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              comment?.photo != ""
                  ? Image(
                      image: AssetImage(comment?.photo ?? ""),
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.file(
                          File(comment?.photo ?? ""),
                        );
                      },
                      //height: 160,
                      //width: 314,
                    )
                  : Container(),
            ],
          ),
        ),
      ],
    );
  }
}
