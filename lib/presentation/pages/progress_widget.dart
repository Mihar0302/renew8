import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ReNew8/controller/home_controller.dart';
import 'package:ReNew8/presentation/pages/sub_stage.dart';
import 'package:ReNew8/utils/app_color.dart';
import 'package:get/get.dart';
import '../widgets/custom_empty.dart';

class ProgressWidget extends StatefulWidget {
  final Size size;
  final HomeController homeController;

  const ProgressWidget({
    Key? key,
    required this.size,
    required this.homeController,
  }) : super(key: key);

  @override
  State<ProgressWidget> createState() => _ProgressWidgetState();
}

class _ProgressWidgetState extends State<ProgressWidget> {
  RxBool loading = false.obs;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(() => loading.value
          ? const Center(child: CircularProgressIndicator())
          : widget.homeController.stageList.isNotEmpty
              ? Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 15, horizontal: Get.width / 30),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: widget.homeController.stageList[0].data.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: const EdgeInsets.only(bottom: 15),
                          child: InkWell(
                            onTap: () {
                              log("===> subsgate ===>   ${widget.homeController.stageList[0].data}");
                              Get.to(() => SubDocument(
                                    size: size,
                                    subStage: widget.homeController.stageList[0]
                                        .data[index]['sub_stage'] as List,
                                    subStageDocument: widget
                                        .homeController
                                        .stageList[0]
                                        .data[index]["sub_stage_document"],
                                  ));
                            },
                            child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColor.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColor.grey.withOpacity(0.3),
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.homeController.stageList[0]
                                                .data[index]['title'],
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          SizedBox(
                                            width: Get.width / 1.5,
                                            child: Text(
                                              widget.homeController.stageList[0]
                                                  .data[index]['title']
                                                  .toString(),
                                              maxLines: 2,
                                              style: TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontSize: 16,
                                                  color: AppColor.grey,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                "Status : ",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Text(
                                                widget
                                                                .homeController
                                                                .stageList[0]
                                                                .data[index]
                                                            ['status'] ==
                                                        "done"
                                                    ? "COMPLETED"
                                                    : "PENDING",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                    color: widget
                                                                    .homeController
                                                                    .stageList[0]
                                                                    .data[index]
                                                                ['status'] ==
                                                            "done"
                                                        ? AppColor.green
                                                        : AppColor.red),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      const Spacer(),
                                      CircleAvatar(
                                        backgroundColor: AppColor.primaryColor,
                                        radius: 15,
                                        child: Center(
                                          child: Icon(
                                            Icons.navigate_next,
                                            color: AppColor.white,
                                          ),
                                        ),
                                      )
                                      // Column(
                                      //   children: [
                                      //     InkWell(
                                      //       onTap: () {
                                      //
                                      //       },
                                      //       child: Container(
                                      //         width: Get.width / 5,
                                      //         height: Get.height / 18,
                                      //         alignment: Alignment.center,
                                      //         decoration: BoxDecoration(
                                      //             color: AppColor.primaryColor,
                                      //             borderRadius: const BorderRadius.only(
                                      //                 bottomLeft: Radius.circular(15),
                                      //                 topRight: Radius.circular(15))),
                                      //         child: Text(
                                      //           "Doc",
                                      //           style: TextStyle(
                                      //               color: AppColor.white,
                                      //               fontWeight: FontWeight.w500,
                                      //               fontSize: size.width * 0.044),
                                      //         ),
                                      //       ),
                                      //     ),
                                      //     const SizedBox(
                                      //       height: 5,
                                      //     ),
                                      //     InkWell(
                                      //       onTap: () {
                                      //
                                      //       },
                                      //       child: Container(
                                      //         width: Get.width / 5,
                                      //         height: Get.height / 18,
                                      //         alignment: Alignment.center,
                                      //         decoration: BoxDecoration(
                                      //             border: Border.all(
                                      //                 color: AppColor.primaryColor),
                                      //             // color: AppColor.primaryColor,
                                      //             borderRadius: const BorderRadius.only(
                                      //                 bottomRight: Radius.circular(15),
                                      //                 topLeft: Radius.circular(15))),
                                      //         child: Text(
                                      //           "Stage",
                                      //           style: TextStyle(
                                      //               color: AppColor.primaryColor,
                                      //               fontWeight: FontWeight.w500,
                                      //               fontSize: size.width * 0.044),
                                      //         ),
                                      //       ),
                                      //     ),
                                      //   ],
                                      // )
                                    ],
                                  ),
                                )),
                          ));
                    },
                  ),
                )
              : Center(child: CustomEmpty(size: size))),
    );
  }
}

class StepperContainer extends StatelessWidget {
  final String text;
  final bool completed;

  const StepperContainer({
    super.key,
    required this.text,
    this.completed = false,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return completed
        ? Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(
              vertical: 5,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.primaryColor,
            ),
            child: Center(
              child: Icon(
                Icons.add,
                color: AppColor.white,
                size: 20,
              ),
            ),
          )
        : Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(
              vertical: 5,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColor.primaryColor, width: 2),
              color: AppColor.white,
            ),
            child: Center(
                child: Text(
              text,
              style: TextStyle(
                  fontSize: size.width * 0.033,
                  color: AppColor.primaryColor,
                  fontWeight: FontWeight.bold),
            )),
          );
  }
}
