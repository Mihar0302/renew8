import 'package:ReNew8/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ReNew8/controller/global_controller.dart';
import 'package:ReNew8/utils/app_image.dart';
import '../../utils/route_string.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GlobalController global = Get.find();

  @override
  void initState() {
    debugPrint("===>login token =====> ${global.userToken.value} ");
    Future.delayed(const Duration(seconds: 3)).then((value) {
      global.userToken.value.isNotEmpty
          ? Navigator.pushReplacementNamed(context, RouteString.HOME_SCREEN)
          : Navigator.pushReplacementNamed(context, RouteString.LOGIN_SCREEN);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Center(
        child: Image.asset(
          AppImages.logo,
          height: size.height * 0.34,
          fit: BoxFit.cover,
        ),
      ),
      // body: Stack(
      //   children: [
      //     Image.asset(
      //       AppImages.backGround,
      //       height: size.height,
      //       fit: BoxFit.fitHeight,
      //     ),
      //     Container(
      //       height: size.height,
      //       width: size.width,
      //       color: AppColor.primaryColor.withOpacity(0.84),
      //     ),
      //     Center(
      //       child: Image.asset(
      //         AppImages.logo,
      //         height: size.height * 0.36,
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
