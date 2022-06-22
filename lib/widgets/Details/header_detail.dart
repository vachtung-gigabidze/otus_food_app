import 'package:flutter/material.dart';
import 'package:otus_food_app/constants.dart';

import 'package:otus_food_app/model.dart';

class HeaderDetail extends StatelessWidget {
  const HeaderDetail({Key? key, required this.snapshot}) : super(key: key);

  final AsyncSnapshot<RecipesModel> snapshot;

  @override
  Widget build(BuildContext context) {
    var recept = snapshot.data?.recipes?[0];

    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            recept?.name ?? "Название рецепта",
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              fontSize: 24.0,
              color: Colors.black87,
              decoration: TextDecoration.none,
            ),
          ),
          Row(
            children: [
              const Image(
                image: AssetImage(Constants.ICON_CLOCK),
                height: 16,
                width: 16,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 11.0),
                child: Text(
                  recept?.time ?? "",
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                    color: Color(0xFF2ECC71),
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ],
          ),
          Text(recept?.time ?? "Время приготовления"),
          Image(image: AssetImage('assets/images/1_full.png')),
        ],
      ),
    );
  }
}
