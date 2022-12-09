import 'package:flutter/material.dart';
import 'package:otus_food_app/feature/freezer/domain/entities/freezer.dart';

class FreezerIngredient extends StatelessWidget {
  const FreezerIngredient(
      {Key? key, required this.freezers, this.title = 'Ингредиенты'})
      : super(key: key);

  final List<Freezer>? freezers;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
            color: Color(0xFF165932),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: const Color(0xFF797676),
              width: 3,
            ),
          ),
          child: ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding:
                  const EdgeInsets.only(top: 15, left: 8, right: 8, bottom: 18),
              itemCount: freezers?.length ?? 0,
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
                            '${freezers?[index].ingredient?.name}',
                            style: const TextStyle(
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 90,
                        child: Text(
                          '${freezers?[index].showQuantity()}',
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
