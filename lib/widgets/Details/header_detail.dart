import 'package:flutter/material.dart';
import 'package:otus_food_app/constants.dart';

import 'package:otus_food_app/model.dart';

class HeaderDetail extends StatefulWidget {
  const HeaderDetail({Key? key, required this.recipe}) : super(key: key);

  final Recipe recipe;

  @override
  State<HeaderDetail> createState() => _HeaderDetailState();
}

class _HeaderDetailState extends State<HeaderDetail> {
  late bool isFavorites;
  late Recipe recipe;

  @override
  void initState() {
    super.initState();
    recipe = widget.recipe;
    isFavorites = false;
  }

  @override
  Widget build(BuildContext context) {
    //var recept = widget.snapshot.data;

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
                recipe.name ?? "Название рецепта",
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
              child: InkWell(
                onTap: () => setState(() {
                  isFavorites = !isFavorites;
                }),
                child: Image.asset(
                  isFavorites
                      ? Constants.iconHeartRed
                      : Constants.iconHeartBlack,
                  height: 30,
                  width: 30,
                ),
              ),
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
              recipe.time ?? "Время приготовления",
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
