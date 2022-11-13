import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/feature/recipe_list/domain/entities/recipe_entity.dart';
import 'package:otus_food_app/utils/recipe_utils.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    const defaultFont = 'Roboto';
    return Card(
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 136,
          ),
          CachedNetworkImage(
            imageUrl: recipe.photo!,
            fit: BoxFit.cover,
            height: 136,
            width: 149,
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
                    recipe.name!,
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
                          RecipeUtils.nameTime(recipe.duration!),
                          overflow: TextOverflow.ellipsis,
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
        ],
      ),
    );
  }
}
