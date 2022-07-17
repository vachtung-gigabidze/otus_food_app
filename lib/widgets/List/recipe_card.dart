import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/model.dart';

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

  Future<Image> _loadImage(String img, Image blank) async {
    return rootBundle.load(img).then((value) {
      return Image.memory(
        value.buffer.asUint8List(),
        fit: BoxFit.fill,
        height: 136,
        width: 149,
      );
    }).catchError((_) {
      return blank;
    });
  }

  @override
  Widget build(BuildContext context) {
    const defaultFont = 'Roboto';
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .pushReplacementNamed('/detail', arguments: recipe);
        },
        child: Row(
          children: <Widget>[
            const SizedBox(
              height: 136, // default\minimum height
            ),

            FutureBuilder<Image>(
                future: _loadImage(
                    'assets/images/${recipe?.imageUrl}', _blankImage()),
                builder: (BuildContext context, AsyncSnapshot<Image> image) {
                  if (image.hasData) {
                    return image.data!;
                  } else {
                    return _blankImage();
                  }
                }),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
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
                            recipe?.time ?? "",
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
      ),
    );
  }
}
