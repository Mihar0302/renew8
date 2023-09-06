import 'package:flutter/material.dart';

import '../../utils/app_color.dart';

class CustomBtn extends StatelessWidget {
  final Size size;
  final String btnName;
  final Function onClick;

  const CustomBtn(
      {Key? key,
      required this.size,
      required this.btnName,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Container(
        alignment: Alignment.center,
        width: size.width,
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        padding: EdgeInsets.symmetric(
          vertical: size.height * 0.017,
          horizontal: size.width * 0.06,
        ),
        decoration: BoxDecoration(
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(10)),
        child: Text(
          btnName,
          style: TextStyle(
              color: AppColor.white,
              fontWeight: FontWeight.w500,
              fontSize: size.width * 0.044),
        ),
      ),
    );
  }
}
