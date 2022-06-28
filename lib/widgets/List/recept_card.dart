import 'package:flutter/material.dart';
import 'package:otus_food_app/Constants.dart';
import 'package:otus_food_app/model.dart';

class ReceptCard extends StatelessWidget {
  ReceptCard({Key? key, required Recipe this.recept}) : super(key: key);

  Recipe? recept;

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
                ],
              ),
            ),
          ],
        ),
      ),
    );
    // return Container(
    //   decoration: const BoxDecoration(
    //       color: Colors.white,
    //       borderRadius: BorderRadius.all(
    //         Radius.circular(5),
    //       )),
    //   margin: const EdgeInsets.all(12),
    //   // color: Colors.white,
    //   child: Row(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Image(
    //         image: AssetImage('assets/images/${recept?.imageUrl}'),
    //         fit: BoxFit.fill,
    //         // repeat: ImageRepeat.repeat,
    //         height: 136,
    //         width: 149,
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(16.0),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             LimitedBox(
    //               child: Text(
    //                 recept?.name ?? "",
    //                 overflow: TextOverflow.ellipsis,
    //                 textDirection: TextDirection.ltr,
    //                 maxLines: 2,
    //                 style: const TextStyle(
    //                   fontFamily: 'Roboto',
    //                   fontStyle: FontStyle.normal,
    //                   fontWeight: FontWeight.w500,
    //                   fontSize: 20.0,
    //                   color: Colors.black87,
    //                   decoration: TextDecoration.none,
    //                 ),
    //               ),
    //             ),
    //             Padding(
    //               padding: const EdgeInsets.only(top: 23.0),
    //               child: Row(
    //                 children: [
    //                   const Image(
    //                     image: AssetImage(Constants.ICON_CLOCK),
    //                     height: 16,
    //                     width: 16,
    //                     fit: BoxFit.cover,
    //                   ),
    //                   Padding(
    //                     padding: const EdgeInsets.only(left: 11.0),
    //                     child: Text(
    //                       recept?.time ?? "",
    //                       style: const TextStyle(
    //                         fontFamily: 'Roboto',
    //                         fontStyle: FontStyle.normal,
    //                         fontWeight: FontWeight.w400,
    //                         fontSize: 16.0,
    //                         color: Color(0xFF2ECC71),
    //                         decoration: TextDecoration.none,
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
