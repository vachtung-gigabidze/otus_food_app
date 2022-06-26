import 'package:flutter/material.dart';
import 'package:otus_food_app/model.dart';

class IngredientsDetails extends StatelessWidget {
  IngredientsDetails({Key? key, required this.snapshot}) : super(key: key);

  final AsyncSnapshot<RecipesModel> snapshot;

  @override
  Widget build(BuildContext context) {
    var recept = snapshot.data?.recipes?[0];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 18,
        ),
        Text(
          'Ингредиенты',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
            color: Color(0xFF165932),
          ),
        ),
        SizedBox(
          height: 22,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Color.fromARGB(255, 121, 118, 118),
              width: 3,
            ),
          ),
          child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              padding: const EdgeInsets.all(6),
              itemCount: recept?.ingredients?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
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
                              '${recept?.ingredients?[index].name}',
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
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            '${recept?.ingredients?[index].quantity}',
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
                  ),
                );
              }),
        )
      ],
    );
  }
}
