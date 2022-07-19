import 'package:flutter/material.dart';
import 'package:otus_food_app/constants.dart';

Widget commentView() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Image(
        image: AssetImage(Constants.avatar_1),
        fit: BoxFit.cover,
        height: 63,
        width: 63,
      ),
      const SizedBox(
        width: 18,
      ),
      Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'anna_obraztsova',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                    color: Color(0xFF2ECC71),
                  ),
                ),
                Text(
                  '25.05.2022',
                  style: TextStyle(
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
              children: const [
                Expanded(
                  child: Text(
                    'Я не большой любитель рыбы, но решила приготовить по этому рецепту и просто влюбилась! ',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    //overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const Image(
              image: AssetImage(Constants.commentImage_1),
              fit: BoxFit.cover,
              //height: 160,
              //width: 314,
            ),
          ],
        ),
      ),
    ],
  );
}
