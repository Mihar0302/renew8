import 'package:get/get.dart';
import 'package:ReNew8/utils/app_color.dart';

class Methods {
  static showSnack(String title, String message) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.TOP,
        colorText: AppColor.white,
        backgroundColor: AppColor.red.withOpacity(0.7));
  }

  static showSnackDone(String title, String message) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.TOP,
        colorText: AppColor.white,
        backgroundColor: AppColor.green.withOpacity(0.7));
  }
}
