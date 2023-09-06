import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ReNew8/helper/http_helper.dart';
import '../models/login_model.dart';
import '../models/stage_model.dart';

class GlobalController extends GetxController {
  RxString fcmToken = "".obs;
  RxString userToken = "".obs;
  RxString userFistNAme = "".obs;
  RxInt userId = 0.obs;

  List<Login> userData = [];

  loginApiCall(
      {required String userName,
      required String password,
      required Function onClick}) async {
    userData.clear();
    Login? loginData = await HttpHelper.loginApi(
      userName: userName,
      password: password,
      token: fcmToken.value,
    );
    if (loginData != null) {
      userData.add(loginData);
      // userId.value = userData[0].data["id"];
      // userToken.value = userData[0].data["token"];
      userId.value = userData[0].data["id"];
      userToken.value = userData[0].data["token"];
      userFistNAme.value =
          "${userData[0].data["first_name"] + userData[0].data["last_name"]}";
      debugPrint("===>userId ====>   ${userData[0].data["id"]}");
      debugPrint("===>userId ====>   ${userData[0].data["token"]}");
      onClick();
    }
  }
}
