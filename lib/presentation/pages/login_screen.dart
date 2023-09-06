import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ReNew8/controller/global_controller.dart';
import 'package:ReNew8/presentation/widgets/custom_btn.dart';
import 'package:ReNew8/presentation/widgets/custum_text_feild.dart';
import 'package:ReNew8/utils/app_color.dart';
import 'package:ReNew8/utils/app_image.dart';

import '../../utils/route_string.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  GlobalController global = Get.put(GlobalController());

  @override
  void initState() {
    debugPrint("====> FCM token ====> ${global.fcmToken.value}");
    debugPrint("====> userToen  token ====> ${global.userToken.value}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.14),
            Center(
              child: Image.asset(
                AppImages.login,
                height: size.height * 0.22,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: Text(
                "Let's Sign In",
                style: TextStyle(fontSize: size.width * 0.057, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
              child: SizedBox(
                width: size.width * 0.6,
                child: Text(
                  "Welcome you've will been missed!",
                  style: TextStyle(
                    fontSize: size.width * 0.045,
                    fontWeight: FontWeight.w400,
                    color: AppColor.grey,
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.05),
            CustomTextFild(
              margin: true,
              size: size,
              hint: "Enter Email",
              controller: email,
            ),
            SizedBox(height: size.height * 0.025),
            CustomTextFild(
              margin: true,
              size: size,
              hint: "Enter Password",
              controller: password,
            ),
            SizedBox(height: size.height * 0.05),
            CustomBtn(
                size: size,
                btnName: "Sign In",
                onClick: () {
                  if (email.text.isNotEmpty || password.text.isNotEmpty) {
                    global.loginApiCall(
                        userName: email.text,
                        password: password.text,
                        onClick: () {
                          Navigator.pushReplacementNamed(context, RouteString.HOME_SCREEN);
                        });
                  } else {
                    Get.snackbar(
                      "Alert",
                      "Please Enter ID and Password",
                      backgroundColor: AppColor.red,
                      colorText: AppColor.white,
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
