import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ReNew8/controller/home_controller.dart';

import '../../../../utils/app_image.dart';
import '../../utils/app_color.dart';

class CustomBottomBar extends StatelessWidget {
  final Size size;
  final Function funcOne;
  final Function funcTwo;
  final Function funcThree;
  final Function fucFour;
  final Function fucFive;
  final int index;

  const CustomBottomBar({
    Key? key,
    required this.size,
    required this.funcOne,
    required this.funcTwo,
    required this.funcThree,
    required this.fucFour,
    required this.fucFive,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: size.height * 0.085,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.white,
          boxShadow: [
            BoxShadow(
              color: AppColor.grey.withOpacity(0.7),
              blurRadius: 10,
              offset: const Offset(7, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: bottomBtn(
                textLabel: "Home",
                onTap: () {
                  funcOne();
                },
                index: index,
                lightIcon: AppImages.home,
                color: index == 0 ? AppColor.primaryColor : AppColor.grey,
                textColor: index == 0 ? AppColor.primaryColor : AppColor.grey,
              ),
            ),
            Expanded(
              child: bottomBtn(
                  textLabel: "Progress",
                  onTap: () {
                    funcTwo();
                  },
                  index: index,
                  lightIcon: AppImages.progress,
                  color: index == 1 ? AppColor.primaryColor : AppColor.grey,
                  textColor:
                      index == 1 ? AppColor.primaryColor : AppColor.grey),
            ),
            Expanded(
              child: bottomBtn(
                textLabel: "Live",
                onTap: () {
                  funcThree();
                },
                index: index,
                lightIcon: AppImages.live,
                color: index == 2 ? AppColor.primaryColor : AppColor.grey,
                textColor: index == 2 ? AppColor.primaryColor : AppColor.grey,
              ),
            ),
            Expanded(
              child: bottomBtn(
                textLabel: "Docs",
                onTap: () {
                  fucFour();
                },
                index: index,
                lightIcon: AppImages.docs,
                color: index == 3 ? AppColor.primaryColor : AppColor.grey,
                textColor: index == 3 ? AppColor.primaryColor : AppColor.grey,
              ),
            ),
            Expanded(
              child: bottomBtn(
                  textLabel: "Account",
                  onTap: () {
                    fucFive();
                  },
                  index: index,
                  lightIcon: AppImages.user,
                  color: index == 4 ? AppColor.primaryColor : AppColor.grey,
                  textColor:
                      index == 4 ? AppColor.primaryColor : AppColor.grey),
            ),
          ],
        ));
  }

  Widget bottomBtn({
    required Function onTap,
    required int index,
    required String lightIcon,
    required Color color,
    required Color textColor,
    required String textLabel,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        onTap();
      },
      child: Container(
        height: size.height * 0.1,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.014),
        child: Column(
          children: [
            Image.asset(
              lightIcon,
              fit: BoxFit.cover,
              height: size.height * 0.029,
              color: color,
            ),
            SizedBox(height: size.height * 0.005),
            Text(
              textLabel,
              style: TextStyle(
                fontSize: size.width * 0.033,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
