import 'package:flutter/material.dart';

import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/model.dart';
import 'package:otus_food_app/utils/recipe_utils.dart';

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
            Flexible(
              fit: FlexFit.tight,
              flex: 5,
              // height: 31,
              // width: 314,
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
            Flexible(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(right: 20),
                child: InkWell(
                  onTap: () => setState(() {
                    isFavorites = !isFavorites;
                    // if (isFavorites) {
                    //   recipe.favorites = recipe.favorites! + 1;
                    // } else {
                    //   recipe.favorites = recipe.favorites! - 1;
                    // }
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
              RecipeUtils.nameTime(recipe.time!),
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
        Stack(children: [
          const Image(
            image: AssetImage('assets/images/1_full.png'),
          ),
          (recipe.favorites!.isNotEmpty)
              ? const Positioned(
                  bottom: 13.9,
                  right: 0,
                  child: Image(
                    image: AssetImage(Constants.flagIcon),
                    height: 43,
                    width: 66,
                    fit: BoxFit.cover,
                  ),
                )
              : Container(),
          recipe.favorites!.isNotEmpty
              ? Positioned(
                  bottom: 30,
                  right: 7,
                  child: Text(
                    '${recipe.favorites!.length}',
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w800,
                      fontSize: 18.0,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                )
              : Container(),
        ]),
      ],
    );
  }
}
