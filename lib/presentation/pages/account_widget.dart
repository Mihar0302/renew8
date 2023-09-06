import 'dart:developer';
import 'dart:io';

import 'package:ReNew8/presentation/pages/doc_show_screen.dart';
import 'package:ReNew8/presentation/widgets/custom_empty.dart';
import 'package:flutter/material.dart';
import 'package:ReNew8/controller/home_controller.dart';
import 'package:ReNew8/presentation/widgets/details_dailog.dart';
import 'package:ReNew8/utils/app_color.dart';
import 'package:ReNew8/utils/app_image.dart';
import 'package:get/get.dart';
import 'dart:core';

import 'package:http/http.dart';
import 'package:mime/mime.dart';

class AccountWidget extends StatefulWidget {
  final HomeController homeController;
  final Size size;

  const AccountWidget({
    Key? key,
    required this.size,
    required this.homeController,
  }) : super(key: key);

  @override
  State<AccountWidget> createState() => _AccountWidgetState();
}

class _AccountWidgetState extends State<AccountWidget> {
  final HomeController homeControllerTotal = Get.find();
  List data = [];
  List sumData = [];
  List receivedAmountList = [];
  RxInt totalAmount = 0.obs;
  RxInt totalAmountCost = 0.obs;
  int valueOne = 0;
  int valueTwo = 0;
  var sum;

  List subStage = [];

  List subStageData = [];
  List dataData = [];
  List sumDataData = [];
  var sumDatacheck;

  totalAmountFun() {
    for (int i = 0; i < widget.homeController.stageList[0].data.length; i++) {
      subStageData =
          widget.homeController.stageList[0].data[i]['sub_stage'] as List;
    }

    sumDatacheck = dataData.reduce((a, b) => a + b);
    sumDataData.add(sumDatacheck);
    var data = sumDataData.reduce((a, b) => a + b);
    log("====> subStageData ====> $subStageData");
    debugPrint("====> data value ====> $data");
  }

  @override
  void initState() {
    for (int i = 0; i < widget.homeController.stageList[0].data.length; i++) {
      debugPrint("====> data value ====> `1 ");
      receivedAmountList
          .add(widget.homeController.stageList[0].data[i]['amount']);
      totalAmount.value = receivedAmountList.reduce((a, b) => a + b);
      subStageData =
          widget.homeController.stageList[0].data[i]['sub_stage'] as List;

      for (int b = 0; b < subStageData.length; b++) {
        debugPrint("====> data value ====> 2 ");
        dataData.add(int.parse(subStageData[b]["rate"]));
      }
    }
    sumDatacheck = dataData.reduce((a, b) => a + b);
    sumDataData.add(sumDatacheck);
    totalAmountCost.value = sumDataData.reduce((a, b) => a + b);
    debugPrint("====> data value ====> ${totalAmountCost.value}");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return widget.homeController.stageList[0].data.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: widget.size.height * 0.02),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount:
                            widget.homeController.stageList[0].data.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, int i) {
                          data.clear();
                          subStage = widget.homeController.stageList[0].data[i]
                              ['sub_stage'] as List;
                          if (subStage.isNotEmpty) {
                            for (int b = 0; b < subStage.length; b++) {
                              data.add(int.parse(subStage[b]["rate"]));
                            }
                            sum = data.reduce((a, b) => a + b);
                            sumData.add(sum);
                          }

                          return Container(
                            height: widget.size.height * 0.22,
                            margin: EdgeInsets.symmetric(
                              horizontal: widget.size.width * 0.04,
                              vertical: widget.size.height * 0.008,
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: widget.size.height * 0.017,
                              horizontal: widget.size.width * 0.04,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: AppColor.white,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColor.grey.withOpacity(0.3),
                                  blurRadius: 10,
                                  spreadRadius: 1,
                                  offset: const Offset(0.1, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.homeController.stageList[0]
                                              .data[i]['title'],
                                          style: TextStyle(
                                            fontSize: widget.size.width * 0.044,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          height: widget.size.height * 0.003,
                                        ),
                                        Text(
                                          widget.homeController.stageList[0]
                                                      .data[i]['status'] ==
                                                  "done"
                                              ? "COMPLETED"
                                              : "PENDING",
                                          style: TextStyle(
                                            fontSize: widget.size.width * 0.041,
                                            color: AppColor.green,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Expanded(child: Container()),
                                    // Text(
                                    //   "₹$sum",
                                    //   style: TextStyle(
                                    //     fontSize: widget.size.width * 0.045,
                                    //     fontWeight: FontWeight.w500,
                                    //   ),
                                    // ),
                                    Expanded(child: Container()),
                                    InkWell(
                                      onTap: () {
                                        final doc = widget
                                            .homeController
                                            .stageList[0]
                                            .data[i]['payment_file'];

                                        String? mimeStr = lookupMimeType(doc);
                                        var fileType = mimeStr!.split('/');
                                        final dataType = fileType.last;
                                        Get.to(() => DocShowScreen(
                                            image: widget
                                                .homeController
                                                .stageList[0]
                                                .data[i]['payment_file'],
                                            docType: dataType == "pdf"
                                                ? "doc"
                                                : ""));
                                        print('file type $dataType');
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: widget.size.height * 0.01,
                                          horizontal: widget.size.width * 0.03,
                                        ),
                                        decoration: BoxDecoration(
                                          color: AppColor.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Text(
                                          "Receipt",
                                          style: TextStyle(
                                            fontSize: widget.size.width * 0.039,
                                            color: AppColor.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10),
                                ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    itemCount: subStage.length,
                                    itemBuilder: (context, int i) {
                                      return RowTest(
                                          size: size,
                                          title: subStage[i]["sub_title"],
                                          text: "₹ ${subStage[i]["rate"]}");
                                    }),
                                Expanded(child: Container()),
                                RowTest(
                                    size: size,
                                    title: "Total Amount",
                                    text: "₹ $sum"),
                              ],
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: widget.size.width,
                padding: EdgeInsets.symmetric(
                  vertical: widget.size.height * 0.005,
                  horizontal: widget.size.width * 0.05,
                ),
                margin:
                    EdgeInsets.symmetric(horizontal: widget.size.width * 0.03),
                decoration: BoxDecoration(
                  color: AppColor.blue.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: widget.size.height * 0.015),
                    Text(
                      "Project Summery",
                      style: TextStyle(
                        color: AppColor.black,
                        fontSize: widget.size.width * 0.045,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: widget.size.height * 0.015),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Project Cost",
                              style: TextStyle(
                                color: AppColor.black,
                                fontSize: widget.size.width * 0.038,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: widget.size.height * 0.005,
                            ),
                            Text(
                              "₹ ${totalAmountCost.value}",
                              style: TextStyle(
                                color: AppColor.black,
                                fontSize: widget.size.width * 0.045,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Project Received",
                              style: TextStyle(
                                  color: AppColor.black,
                                  fontSize: widget.size.width * 0.038,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: widget.size.height * 0.005,
                            ),
                            Text(
                              "₹ ${totalAmount.value}",
                              style: TextStyle(
                                color: AppColor.black,
                                fontSize: widget.size.width * 0.045,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: widget.size.height * 0.01),
                  ],
                ),
              ),
              SizedBox(height: widget.size.height * 0.01),
            ],
          )
        : CustomEmpty(size: size);
  }
}

class NextContainer extends StatelessWidget {
  final Size size;
  final Function onClick;
  final String title;
  final String img;

  const NextContainer({
    super.key,
    required this.size,
    required this.onClick,
    required this.title,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick();
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.05,
        ),
        padding: EdgeInsets.symmetric(
          vertical: size.height * 0.02,
          horizontal: size.width * 0.05,
        ),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColor.grey.withOpacity(0.3),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(
              img,
              height: size.height * 0.03,
              fit: BoxFit.contain,
              color: AppColor.black.withOpacity(0.7),
            ),
            SizedBox(width: size.width * 0.07),
            Text(
              title,
              style: TextStyle(
                fontSize: size.width * 0.042,
                fontWeight: FontWeight.w500,
              ),
            ),
            Expanded(child: Container()),
            Image.asset(
              AppImages.next,
              height: size.height * 0.03,
              fit: BoxFit.contain,
              color: AppColor.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
