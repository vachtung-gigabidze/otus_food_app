import 'package:flutter/material.dart';

import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/models/recipe_model.dart';
// import 'package:otus_food_app/model.dart';
import 'package:otus_food_app/utils/recipe_utils.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({Key? key, this.recipe, this.showFavorites = false})
      : super(key: key);

  final Recipe? recipe;
  final bool showFavorites;

  Image _blankImage() => Image.asset(
        'assets/icons/blank.png',
        fit: BoxFit.fill,
        height: 136,
        width: 149,
      );

  @override
  Widget build(BuildContext context) {
    const defaultFont = 'Roboto';
    return Card(
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 136, // default\minimum height
          ),
          FadeInImage(
            fit: BoxFit.cover,
            height: 136,
            width: 149,
            placeholder: _blankImage().image,
            image: AssetImage('assets/images/${recipe?.photo}'),
            imageErrorBuilder: (context, error, stackTrace) {
              return _blankImage();
            },
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  height: 52,
                  child: Text(
                    recipe?.name ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontFamily: defaultFont,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w600,
                      fontSize: 24.0,
                      color: Colors.black87,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    const Image(
                      image: AssetImage(Constants.iconClock),
                      height: 16,
                      width: 16,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 11.0),
                      child: SizedBox(
                        height: 19,
                        child: Text(
                          RecipeUtils.nameTime(recipe?.duration ?? 0),
                          style: const TextStyle(
                            fontFamily: defaultFont,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            fontSize: 16.0,
                            color: Color(0xFF2ECC71),
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 23,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 23,
          ),
          // showFavorites
          //     ? Stack(children: const [
          //         Image(
          //           image: AssetImage(Constants.flagIcon),
          //           height: 43,
          //           width: 66,
          //           fit: BoxFit.cover,
          //         ),
          //         Positioned(
          //           top: 5,
          //           left: 45,
          //           child: Text(
          //             '2',
          //             style: TextStyle(
          //               fontFamily: defaultFont,
          //               fontStyle: FontStyle.normal,
          //               fontWeight: FontWeight.w800,
          //               fontSize: 18.0,
          //               color: Color(0xFFFFFFFF),
          //             ),
          //           ),
          //         ),
          //       ])
          //     : Container(),
        ],
      ),
    );
  }
}
