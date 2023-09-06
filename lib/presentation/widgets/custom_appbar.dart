import 'package:flutter/material.dart';
import '../../utils/app_color.dart';
import '../../utils/app_image.dart';

class CustomAppBar extends StatelessWidget {
  final Size size;
  final Function onClick;
  final String title;
  final bool name;
  final bool back;
  final Function? logout;
  final bool logoutdata;
  final Function? notification;

  const CustomAppBar({
    Key? key,
    required this.size,
    required this.onClick,
    required this.title,
    this.name = false,
    this.back = false,
    this.logout,
    this.logoutdata = false,
    this.notification,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 10,
          bottom: 10,
        ),
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
        ),
        child: Row(
          children: [
            SizedBox(width: size.width * 0.035),
            back
                ? Container()
                : InkWell(
                    onTap: () {
                      onClick();
                    },
                    child: Image.asset(
                      AppImages.back,
                      height: size.height * 0.033,
                      fit: BoxFit.contain,
                      color: AppColor.white,
                    ),
                  ),
            name
                ? SizedBox(width: size.width * 0.05)
                : Expanded(child: Container()),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: AppColor.white,
                fontSize: size.width * 0.045,
              ),
            ),
            Expanded(child: Container()),
            logoutdata
                ? Row(
                    children: [
                      InkWell(
                        onTap: () {
                          notification!();
                        },
                        child: Icon(
                          Icons.notifications_active,
                          size: size.height * 0.027,
                          color: AppColor.white,
                        ),
                      ),
                      SizedBox(width: size.width * 0.02),
                      InkWell(
                        onTap: () {
                          logout!();
                        },
                        child: Icon(
                          Icons.logout,
                          size: size.height * 0.03,
                          color: AppColor.red,
                        ),
                      ),
                    ],
                  )
                : Container(),
            SizedBox(width: size.width * 0.03),
          ],
        ));
  }
}
