import 'package:flutter/material.dart';
import '../../utils/app_color.dart';
import '../../utils/app_image.dart';

class CustomUpdateWidget extends StatelessWidget {
  final Size size;
  final Function onClick;
  final Function onEdit;
  final String timeDate;
  final String description;

  const CustomUpdateWidget(
      {Key? key,
      required this.size,
      required this.onClick,
      required this.onEdit,
      required this.timeDate,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Container(
        width: size.width,
        height: size.height * 0.09,
        margin: EdgeInsets.symmetric(
            horizontal: size.width * 0.05, vertical: size.height * 0.015),
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
        decoration: BoxDecoration(
          color: AppColor.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              color: AppColor.grey.withOpacity(0.25),
              blurRadius: 5,
              spreadRadius: 2,
            )
          ],
          borderRadius: BorderRadius.circular(
            12,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.01),
            Text(
              timeDate,
              style: TextStyle(
                color: AppColor.black,
                fontSize: size.width * 0.035,
              ),
            ),
            Expanded(child: Container()),
            SizedBox(
              width: size.width * 0.6,
              child: Text(
                "New Updates",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  color: AppColor.black,
                  fontWeight: FontWeight.w500,
                  fontSize: size.width * 0.037,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.015),
          ],
        ),
      ),
    );
  }
}
