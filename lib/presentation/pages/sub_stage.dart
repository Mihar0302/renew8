import 'package:ReNew8/presentation/pages/doc_show_screen.dart';
import 'package:flutter/material.dart';
import 'package:ReNew8/controller/home_controller.dart';
import 'package:ReNew8/presentation/widgets/custom_appbar.dart';
import 'package:ReNew8/utils/app_color.dart';
import 'package:get/get.dart';

import '../../utils/app_image.dart';
import '../widgets/custom_tababr.dart';
import 'job_description_screen.dart';

class SubDocument extends StatefulWidget {
  final List subStage;
  final List subStageDocument;
  final size;

  const SubDocument({
    Key? key,
    required this.size,
    required this.subStage,
    required this.subStageDocument,
  }) : super(key: key);

  @override
  State<SubDocument> createState() => _SubDocumentState();
}

class _SubDocumentState extends State<SubDocument> {
  HomeController homeController = Get.find();
  RxInt tabIndex = 0.obs;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
              size: widget.size,
              onClick: () {
                Get.back();
              },
              title: "Sub Stage"),
          Obx(
            () => CustomTabBar(
              size: size,
              textOne: "Sub Stage",
              textTwo: "All Document",
              onTapOne: () {
                tabIndex.value = 0;
              },
              onTapTwo: () {
                tabIndex.value = 1;
              },
              tabColorOne: tabIndex.value == 0 ? AppColor.blue : AppColor.grey,
              tabColorTwo: tabIndex.value == 1 ? AppColor.blue : AppColor.grey,
            ),
          ),
          Obx(
            () => tabIndex.value == 0
                ? Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 15, horizontal: Get.width / 30),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: widget.subStage.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: InkWell(
                              onTap: () {
                                final List<DocData> data = [];
                                for (int b = 0;
                                    b < widget.subStageDocument.length;
                                    b++) {
                                  if (widget.subStageDocument[b]
                                          ["sub_stage_id"] ==
                                      widget.subStage[index]["id"]) {
                                    data.add(DocData(
                                        doc: widget.subStageDocument[b]
                                            ["document_file"],
                                        docType: widget.subStageDocument[b]
                                            ["file_type"]));
                                    Get.to(
                                        () => JobDescriptionScreen(doc: data));
                                    debugPrint("===> $data");
                                  }
                                }
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
                                          blurRadius: 10)
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
                                              widget.subStage[index]
                                                  ["sub_title"],
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
                                                widget.subStage[index]
                                                    ["sub_description"],
                                                maxLines: 2,
                                                style: TextStyle(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontSize: 16,
                                                    color: AppColor.grey,
                                                    fontWeight:
                                                        FontWeight.w400),
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
                                                  "${widget.subStage[index]["sub_status"]}" ==
                                                          "1"
                                                      ? "COMPLETED"
                                                      : "PENDING",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          "${widget.subStage[index]["sub_status"]}" ==
                                                                  "1"
                                                              ? AppColor.green
                                                              : AppColor.red),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        const Spacer(),
                                        CircleAvatar(
                                          backgroundColor:
                                              AppColor.primaryColor,
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
                : GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.subStageDocument.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => DocShowScreen(
                                image: widget.subStageDocument[index]
                                    ["document_file"],
                                docType: widget.subStageDocument[index]
                                    ["file_type"],
                              ));
                        },
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(10),
                            image: widget.subStageDocument[index]
                                        ["file_type"] ==
                                    "doc"
                                ? const DecorationImage(
                                    image: AssetImage(AppImages.pdf),
                                    fit: BoxFit.cover)
                                : DecorationImage(
                                    image: NetworkImage(
                                        widget.subStageDocument[index]
                                            ["document_file"]),
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      );
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    padding: const EdgeInsets.all(15),
                    shrinkWrap: true,
                  ),
          ),
        ],
      ),
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

class DocData {
  final String doc;
  final String docType;

  DocData({required this.doc, required this.docType});
}
