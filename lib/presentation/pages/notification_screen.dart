import 'package:ReNew8/controller/home_controller.dart';
import 'package:ReNew8/presentation/pages/home_widget.dart';
import 'package:ReNew8/presentation/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../utils/app_color.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final HomeController homeController = Get.find();

  String timedata({required String time}) {
    final DateFormat formatter = DateFormat('yMMMMEEEEd');
    final String formatted = formatter.format(DateTime.parse(time));
    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
              size: size,
              onClick: () {
                Get.back();
              },
              title: "Notification"),
          Expanded(
              child: Column(
            children: [
              ListView.builder(
                itemCount: homeController.messageUpdates[0].data.length,
                shrinkWrap: true,
                itemBuilder: (context, int i) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.01,
                      horizontal: size.width * 0.02,
                    ),
                    margin: EdgeInsets.symmetric(
                        horizontal: size.width * 0.05,
                        vertical: size.height * 0.007),
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
                        Text(homeController.messageUpdates[0].data[i]["title"],
                            style: TextStyle(
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(height: size.height * 0.01),
                        Text(
                            homeController.messageUpdates[0].data[i]
                                ["description"],
                            style: TextStyle(
                              fontSize: size.width * 0.035,
                              fontWeight: FontWeight.w400,
                            )),
                        SizedBox(height: size.height * 0.02),
                        Text(
                            "Date:- ${timedata(
                              time: homeController.messageUpdates[0].data[i]
                                  ["created_at"],
                            )}",
                            style: TextStyle(
                                fontSize: size.width * 0.032,
                                fontWeight: FontWeight.w400,
                                color: AppColor.grey)),
                      ],
                    ),
                  );
                },
              ),
            ],
          )),
        ],
      ),
    );
  }
}
