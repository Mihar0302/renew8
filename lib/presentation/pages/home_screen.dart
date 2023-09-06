import 'package:ReNew8/controller/global_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launch/flutter_launch.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';
import 'package:ReNew8/controller/home_controller.dart';
import 'package:ReNew8/presentation/pages/live_widget.dart';
import 'package:ReNew8/presentation/pages/progress_widget.dart';
import 'package:ReNew8/presentation/widgets/custom_bottom_bar.dart';
import 'package:ReNew8/utils/app_color.dart';
import 'package:ReNew8/utils/route_string.dart';

import '../../helper/shared_pref_helper.dart';
import '../../utils/app_image.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_dilog.dart';
import 'account_widget.dart';
import 'documents_screen.dart';
import 'home_widget.dart';
import 'login_screen.dart';
import 'notification_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());
  final GlobalController globalController = Get.find();

  RxBool loading = false.obs;

  @override
  void initState() {
    homeController.messsageApiCall();
    homeController.helpApiCall();
    homeController.reportAnswerApiCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        if (homeController.tab.value == 1) {
          homeController.tab.value = 0;
        } else if (homeController.tab.value == 2) {
          homeController.tab.value = 1;
        } else if (homeController.tab.value == 2) {
          homeController.tab.value = 1;
        } else if (homeController.tab.value == 3) {
          homeController.tab.value = 2;
        } else if (homeController.tab.value == 4) {
          homeController.tab.value = 3;
        }
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Obx(
                  () => CustomAppBar(
                    notification: () {
                      Get.to(() => const NotificationScreen());
                    },
                    logoutdata: true,
                    logout: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) => CustomPopUpWidget(
                          size: size,
                          cancel: () {
                            Get.back();
                          },
                          done: () async {
                            final SharedPreferencesHelper prefs =
                                SharedPreferencesHelper(
                              pref: await SharedPreferences.getInstance(),
                            );
                            globalController.fcmToken.value = "";
                            globalController.userId.value = 0;
                            globalController.userToken.value = "";
                            await prefs.setUserToken("");
                            await prefs.setUserId(0);
                            Get.offAll(() => const LoginScreen());
                          },
                          text: "Do you confirm your logout ?",
                        ),
                      );
                    },
                    back: homeController.tab.value == 0 ? true : false,
                    name: true,
                    size: size,
                    onClick: () {
                      if (homeController.tab.value == 1) {
                        homeController.tab.value = 0;
                      } else if (homeController.tab.value == 2) {
                        homeController.tab.value = 1;
                      } else if (homeController.tab.value == 2) {
                        homeController.tab.value = 1;
                      } else if (homeController.tab.value == 3) {
                        homeController.tab.value = 2;
                      } else if (homeController.tab.value == 4) {
                        homeController.tab.value = 3;
                      }
                    },
                    title: globalController.userFistNAme.value,
                  ),
                ),
                Obx(
                  () => Expanded(
                      child: homeController.tab.value == 0
                          ? HomeWidget(homeController: homeController)
                          : homeController.tab.value == 2
                              ? LiveWidget(homeController: homeController)
                              : homeController.tab.value == 1
                                  ? ProgressWidget(
                                      size: size,
                                      homeController: homeController)
                                  : homeController.tab.value == 3
                                      ? DocumentsScreen(
                                          homeController: homeController)
                                      : homeController.tab.value == 4
                                          ? AccountWidget(
                                              size: size,
                                              homeController: homeController,
                                            )
                                          : Container()),
                ),
                Obx(
                  () => CustomBottomBar(
                    index: homeController.tab.value,
                    size: size,
                    funcOne: () {
                      homeController.tab.value = 0;
                    },
                    funcTwo: () {
                      homeController.tab.value = 1;
                    },
                    funcThree: () {
                      homeController.tab.value = 2;
                    },
                    fucFour: () {
                      homeController.tab.value = 3;
                    },
                    fucFive: () {
                      homeController.tab.value = 4;
                    },
                  ),
                ),
              ],
            ),
            Obx(
              () => homeController.tab.value == 0
                  ? Positioned(
                      bottom: size.height * 0.1,
                      right: size.width * 0.04,
                      child: SpeedDial(
                        closedForegroundColor: Colors.black,
                        openForegroundColor: Colors.white,
                        closedBackgroundColor: Colors.white,
                        openBackgroundColor: AppColor.primaryColor,
                        labelsBackgroundColor: Colors.white,
                        speedDialChildren: <SpeedDialChild>[
                          SpeedDialChild(
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Image.asset(
                                AppImages.man,
                                height: size.height * 0.05,
                                fit: BoxFit.contain,
                                color: AppColor.black,
                              ),
                            ),
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.red,
                            label: 'Report Concern !',
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, RouteString.ABOUT_US_SCREEN);
                            },
                            closeSpeedDialOnPressed: false,
                          ),
                          SpeedDialChild(
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Image.asset(
                                AppImages.help,
                                height: size.height * 0.05,
                                fit: BoxFit.contain,
                                color: AppColor.black,
                              ),
                            ),
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.yellow,
                            label: 'May I help you ?',
                            onPressed: () async {
                              await FlutterLaunch.launchWhatsapp(
                                  phone: homeController.helpData[0].data[0]
                                      ["mobile_no"],
                                  message: "Hello");
                            },
                          ),
                          //  Your other SpeedDialChildren go here.
                        ],
                        child: const Icon(Icons.add),
                      ),
                    )
                  : Container(),
            )
          ],
        ),
      ),
    );
  }
}
