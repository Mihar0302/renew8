import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/app_image.dart';

class ProgressContainer extends StatelessWidget {
  final Size size;
  final String title;
  final String subTitle;
  final String status;
  final String img;
  final Function onClick;

  const ProgressContainer(
      {Key? key,
      required this.size,
      required this.title,
      required this.subTitle,
      required this.status,
      required this.img,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: size.width * 0.15,
              height: size.height * 0.08,
              decoration: BoxDecoration(
                color: AppColor.green,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(img),
                ),
              ),
            ),
            SizedBox(width: size.width * 0.12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.038),
                ),
                SizedBox(height: size.height * 0.01),
                SizedBox(
                  width: size.width * 0.38,
                  child: Text(
                    subTitle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: size.width * 0.035,
                      color: AppColor.grey,
                    ),
                  ),
                ),
                SizedBox(height: size.height * 0.002),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Status : ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.038),
                    ),
                    Text(
                      status,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.grey,
                          fontSize: size.width * 0.038),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
