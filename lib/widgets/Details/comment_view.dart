import 'package:flutter/material.dart';
import 'package:otus_food_app/model.dart';

Widget commentView(Comment? comment) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(31.5),
        child: Image(
          image: AssetImage(comment?.avatar ?? ""),
          errorBuilder: (context, error, stackTrace) {
            return Container(
              height: 63,
              width: 63,
              color: Colors.grey,
            );
          },
          fit: BoxFit.cover,
          height: 63,
          width: 63,
        ),
      ),
      const SizedBox(
        width: 18,
      ),
      Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  comment?.author ?? "",
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                    color: Color(0xFF2ECC71),
                  ),
                ),
                Text(
                  comment?.date ?? "",
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                    color: Color(0xFFC2C2C2),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    comment?.comment ?? '',
                    style: const TextStyle(
                      fontFamily: 'Roboto',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                      color: Colors.black,
                    ),
                    //overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            comment?.image != ""
                ? Image(
                    image: AssetImage(comment?.image ?? ""),
                    fit: BoxFit.cover,
                    //height: 160,
                    //width: 314,
                  )
                : Container(),
          ],
        ),
      ),
    ],
  );
}
