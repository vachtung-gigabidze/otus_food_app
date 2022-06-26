import 'package:flutter/material.dart';
import 'package:otus_food_app/constants.dart';

Widget CommentView() {
  return Column(
    mainAxisSize: MainAxisSize.min,
    // crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('anna_obraztsova'),
          Text('25.05.2022'),
        ],
      ),
      Row(
        children: const [
          Expanded(
            child: Text(
              'Я не большой любитель рыбы, но решила приготовить по этому рецепту и просто влюбилась! ',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
                fontSize: 14.0,
                color: Colors.black,
              ),
              //overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      Image(
        image: AssetImage(Constants.commentImage_1),
        fit: BoxFit.cover,
        height: 160,
        width: 314,
      ),
    ],
  );
}
