import 'package:flutter/material.dart';
import 'package:otus_food_app/constants.dart';

import 'package:otus_food_app/model.dart';

class HeaderDetail extends StatelessWidget {
  const HeaderDetail({Key? key, required this.snapshot}) : super(key: key);

  final AsyncSnapshot<Recipe> snapshot;

  @override
  Widget build(BuildContext context) {
    var recept = snapshot.data;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 31,
              width: 314,
              child: Text(
                recept?.name ?? "Название рецепта",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                  fontSize: 24.0,
                  color: Colors.black87,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: ImageIcon(Image.asset(
                Constants.iconHeart,
                height: 30,
                width: 30,
              ).image),
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          children: [
            const Image(
              image: AssetImage(Constants.iconClock),
              height: 16,
              width: 16,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 11,
            ),
            Text(
              recept?.time ?? "Время приготовления",
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                fontSize: 16.0,
                color: Color(0xFF2ECC71),
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        const Image(
          image: AssetImage('assets/images/1_full.png'),
        ),
      ],
    );
  }
}
