import 'package:flutter/material.dart';
import 'package:otus_food_app/model.dart';

class IngredientsDetails extends StatelessWidget {
  const IngredientsDetails(
      {Key? key, required this.snapshot, this.title = 'Ингредиенты'})
      : super(key: key);

  final List<Ingredient>? snapshot;
  final String title;
  @override
  Widget build(BuildContext context) {
    var ingredients = snapshot;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 18,
        ),
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
            color: Color(0xFF165932),
          ),
        ),
        const SizedBox(
          height: 22,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: const Color.fromARGB(255, 121, 118, 118),
              width: 3,
            ),
          ),
          child: ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.all(6),
              itemCount: ingredients?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text(
                            '\u2022',
                            style: TextStyle(
                              fontSize: 16,
                              height: 1.55,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            '${ingredients?[index].name}',
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 90,
                        child: Text(
                          '${ingredients?[index].quantity} ${ingredients?[index].unit}',
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            fontSize: 13.0,
                            color: Color(0xFF797676),
                          ),
                        ),
                      ),
                    ],
                  )),
                );
              }),
        )
      ],
    );
  }
}
