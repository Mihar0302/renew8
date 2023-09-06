import 'dart:core';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ReNew8/controller/home_controller.dart';
import 'package:ReNew8/presentation/pages/approvals_screen.dart';
import 'package:ReNew8/presentation/pages/doc_show_screen.dart';
import 'package:ReNew8/presentation/pages/updates_screen.dart';
import 'package:ReNew8/presentation/widgets/custom_empty.dart';
import 'package:ReNew8/presentation/widgets/custom_steper.dart';
import '../../utils/app_color.dart';
import '../../utils/app_image.dart';
import '../widgets/custom_updates_widget.dart';

class HomeWidget extends StatefulWidget {
  final HomeController homeController;

  const HomeWidget({Key? key, required this.homeController}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  PageController pageController = PageController();

  String timedata({required String time}) {
    final DateFormat formatter = DateFormat('yMMMMEEEEd');
    final String formatted = formatter.format(DateTime.parse(time));
    return formatted;
  }

  List<Approvals> apporalsLis = [
    Approvals(text: "Quotation", color: AppColor.primaryColor),
    Approvals(text: "Designing", color: const Color(0xFF1C318B)),
    Approvals(text: "Add and Remove Items", color: const Color(0xFF2B48C5)),
    Approvals(text: "Agreement", color: const Color(0xFF4A69BD)),
    Approvals(text: "TimeLine", color: const Color(0xFF73A1EE)),
    Approvals(text: "Other", color: AppColor.blue),
  ];
  RxBool loading = false.obs;

  @override
  void initState() {
    Future.delayed(const Duration(microseconds: 0)).then((value) async {
      loading.value = true;
      await widget.homeController.stageListApiCall();
      await widget.homeController.notificationListApiCall();
      await widget.homeController.quotationApiCall();
      // await widget.homeController.approvalsListApiCall();

      loading.value = false;
    });
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Obx(
      () => loading.value
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.01),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: size.width * 0.05),
                      Text(
                        "Work Progress",
                        style: TextStyle(fontSize: size.width * 0.038),
                      ),
                      SizedBox(width: size.width * 0.015),
                      Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                          color: AppColor.green,
                          shape: BoxShape.circle,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 100,
                    child: widget.homeController.stageList.isNotEmpty
                        ? CustomStper(
                            currentStep:
                                widget.homeController.stageList[0].data.length +
                                    1,
                          )
                        : CustomEmpty(size: size),
                  ),
                  // SizedBox(
                  //   height: size.height * 0.05,
                  //   child: ListView.builder(
                  //     shrinkWrap: true,
                  //     scrollDirection: Axis.horizontal,
                  //     itemCount: 5,
                  //     itemBuilder: (context, int i) {
                  //       return Container(
                  //         margin: EdgeInsets.only(
                  //           right: size.width * 0.08,
                  //         ),
                  //         height: size.height * 0.03,
                  //         width: size.width * 0.1,
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(50),
                  //           color: homeController.stageList[0].data.length == i
                  //               ? AppColor.primaryColor
                  //               : AppColor.grey,
                  //         ),
                  //         child: Center(
                  //           child: Text(
                  //             "${i + 1}",
                  //             style: TextStyle(
                  //                 color: AppColor.white,
                  //                 fontSize: size.width * 0.04),
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                  SizedBox(height: size.height * 0.01),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     SizedBox(width: size.width * 0.05),
                  //     Text(
                  //       "Next payment stage due in 21 days",
                  //       style: TextStyle(
                  //           fontSize: size.width * 0.037,
                  //           color: AppColor.primaryColor,
                  //           fontWeight: FontWeight.w500),
                  //     ),
                  //   ],
                  // ),
                  SizedBox(height: size.height * 0.015),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: size.width * 0.05),
                      Text(
                        "Updates",
                        style: TextStyle(
                            fontSize: size.width * 0.037,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  widget.homeController.notificationList[0].data.isEmpty
                      ? Center(child: CustomEmpty(size: size))
                      : SizedBox(
                          height: Get.height / 2.8,
                          child: ListView.builder(
                              itemCount: widget.homeController
                                  .notificationList[0].data.length,
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, int i) {
                                return CustomUpdateWidget(
                                    size: size,
                                    onClick: () {
                                      debugPrint(
                                          "------------==============${widget.homeController.notificationList[0].data}");
                                      Get.to(() => DocShowScreen(
                                            image: widget
                                                    .homeController
                                                    .notificationList[0]
                                                    .data[i]['document'][0]
                                                ['document_file'],
                                            docType: widget.homeController
                                                    .notificationList[0].data[i]
                                                ["document"][0]['file_type'],
                                          ));
                                    },
                                    description: "New Updates",
                                    onEdit: () {},
                                    timeDate: timedata(
                                      time: widget
                                          .homeController
                                          .notificationList[0]
                                          .data[i]["updated_at"],
                                    ));
                              })),
                  SizedBox(height: size.height * 0.02),
                  widget.homeController.notificationList.isNotEmpty
                      ? (widget.homeController.notificationList[0].data
                                  .length >=
                              3)
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                  InkWell(
                                    onTap: () {
                                      Get.to(UpdatesScreen(
                                          notificationList: widget
                                              .homeController
                                              .notificationList));
                                    },
                                    child: Text(
                                      "View All",
                                      style: TextStyle(
                                        fontSize: size.width * 0.043,
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.grey,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: size.width * 0.01),
                                  Image.asset(
                                    AppImages.next,
                                    height: size.height * 0.02,
                                    fit: BoxFit.cover,
                                    color: AppColor.grey,
                                  )
                                ])
                          : const SizedBox(
                              height: 10,
                            )
                      : CustomEmpty(size: size),
                  SizedBox(height: size.height * 0.01),
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    SizedBox(width: size.width * 0.05),
                    Text(
                      "Approvals",
                      style: TextStyle(
                          fontSize: size.width * 0.04,
                          fontWeight: FontWeight.w500),
                    ),
                  ]),
                  SizedBox(height: size.height * 0.018),
                  SizedBox(
                    height: size.height * 0.15,
                    child: ListView.builder(
                      padding: EdgeInsets.only(left: size.width * 0.02),
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          widget.homeController.quotationList[0].data.length,
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemBuilder: (context, int i) {
                        return InkWell(
                          onTap: () {
                            setState(() {});
                            debugPrint(
                                "===> some new data ==> ${widget.homeController.quotationList[0]}");
                            Get.to(() => ApprovalsScreen(
                                  label: widget.homeController.quotationList[0]
                                      .data[i]["quotation_name"],
                                  quotation: widget
                                      .homeController
                                      .quotationList[0]
                                      .data[i]["approval_data"],
                                ));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(
                              horizontal: size.width * 0.02,
                            ),
                            height: size.height * 0.13,
                            width: size.width * 0.28,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: AppColor.grey,
                                  blurRadius: 5,
                                  offset: const Offset(0.5, 0.5),
                                )
                              ],
                              color: apporalsLis[i].color,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: widget.homeController.quotationList.isEmpty
                                  ? const SizedBox()
                                  : Text(
                                      widget.homeController.quotationList[0]
                                          .data[i]["quotation_name"],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: AppColor.white,
                                        fontSize: size.width * 0.04,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                ],
              ),
            ),
    );
  }
}

class Approvals {
  final String text;
  final Color color;

  Approvals({
    required this.text,
    required this.color,
  });
}

class Steper extends StatelessWidget {
  final Size size;
  final Color color;
  final String text;

  const Steper({
    Key? key,
    required this.size,
    required this.color,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: size.width * 0.08,
      ),
      height: size.height * 0.03,
      width: size.width * 0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: color,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: AppColor.white,
            fontSize: size.width * 0.04,
          ),
        ),
      ),
    );
  }
}
