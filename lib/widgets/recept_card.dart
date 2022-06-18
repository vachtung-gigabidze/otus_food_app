import 'package:flutter/material.dart';
import 'package:otus_food_app/Constants.dart';

class ReceptCard extends StatelessWidget {
  const ReceptCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          )),
      margin: EdgeInsets.all(16),
      // color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Image(
            image: AssetImage(Constants.IMAGE1),
            fit: BoxFit.fill,
            // repeat: ImageRepeat.repeat,
            height: 136,
            width: 149,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Название рецепта \nровно в две строки',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                    color: Colors.black87,
                    decoration: TextDecoration.none,
                  ),
                  maxLines: 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 23.0),
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage(Constants.ICON_CLOCK),
                        height: 16,
                        width: 16,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 11.0),
                        child: Text(
                          '45 минут',
                          style: TextStyle(
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
