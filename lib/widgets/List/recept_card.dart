import 'package:flutter/material.dart';
import 'package:otus_food_app/Constants.dart';
import 'package:otus_food_app/model.dart';

class ReceptCard extends StatelessWidget {
  const ReceptCard({Key? key, this.recept}) : super(key: key);

  final Recipe? recept;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12.0),
      child: InkWell(
        onTap: () {},
        child: Row(
          children: <Widget>[
            const SizedBox(
              height: 70, // default\minimum height
            ),
            Image(
              image: AssetImage('assets/images/${recept?.imageUrl}'),
              fit: BoxFit.fill,
              // repeat: ImageRepeat.repeat,
              height: 136,
              width: 149,
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recept?.name ?? "",
                    overflow: TextOverflow.clip,
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
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                      Stack(children: const [
                        Image(
                          image: AssetImage(Constants.flagIcon),
                          height: 43,
                          width: 66,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 5,
                          left: 45,
                          child: Text(
                            '2',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w800,
                              fontSize: 18.0,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
