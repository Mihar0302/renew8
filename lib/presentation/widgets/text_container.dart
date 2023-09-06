import 'package:flutter/material.dart';

import '../../utils/app_color.dart';

class TextContainer extends StatelessWidget {
  final Size size;
  final String text;

  const TextContainer({Key? key, required this.size, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      width: size.width,
      padding: EdgeInsets.symmetric(
        vertical: size.height * 0.02,
        horizontal: size.width * 0.05,
      ),
      decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColor.grey.withOpacity(0.3),
              blurRadius: 5,
            )
          ]),
      child: Text(
        text,
        style: TextStyle(
          fontSize: size.width * 0.038,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
