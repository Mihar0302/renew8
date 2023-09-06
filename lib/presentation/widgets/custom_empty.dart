import 'package:flutter/material.dart';

import '../../utils/app_image.dart';

class CustomEmpty extends StatelessWidget {
  final Size size;

  const CustomEmpty({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.emptyBox, height: size.height * 0.07),
          SizedBox(height: size.height * 0.01),
          Text(
            "No updates !",
            style: TextStyle(
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
