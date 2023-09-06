import 'package:ReNew8/presentation/pages/doc_show_screen.dart';
import 'package:ReNew8/presentation/pages/documents_details_screen.dart';
import 'package:ReNew8/presentation/pages/documents_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ReNew8/presentation/widgets/custom_appbar.dart';
import 'package:ReNew8/presentation/widgets/custom_btn.dart';
import 'package:ReNew8/presentation/widgets/custom_empty.dart';
import 'package:ReNew8/utils/app_color.dart';

import '../../controller/global_controller.dart';
import '../../controller/home_controller.dart';
import '../widgets/custom_dilog.dart';
import '../widgets/details_dailog.dart';

class ApprovalsScreen extends StatefulWidget {
  final String label;
  final List quotation;

  const ApprovalsScreen({
    Key? key,
    required this.label,
    required this.quotation,
  }) : super(key: key);

  @override
  State<ApprovalsScreen> createState() => _ApprovalsScreenState();
}

class _ApprovalsScreenState extends State<ApprovalsScreen> {
  TextEditingController controller = TextEditingController();
  HomeController homeController = HomeController();
  GlobalController global = Get.put(GlobalController());

  @override
  void initState() {
    debugPrint("==> lenth === > ${widget.quotation.length}");
    super.initState();
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
            title: widget.label,
          ),
          Expanded(
            child: widget.quotation.isNotEmpty
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: widget.quotation.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(height: size.height * 0.02),
                                Container(
                                  width: size.width,
                                  padding: EdgeInsets.symmetric(
                                    vertical: size.height * 0.02,
                                    horizontal: size.width * 0.05,
                                  ),
                                  margin: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.04,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: AppColor.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: AppColor.grey.withOpacity(0.3),
                                          spreadRadius: 1,
                                          blurRadius: 10),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: size.width * 0.6,
                                            child: Text(
                                              // widget.quotation.length.toString(),
                                              "${widget.quotation[index]["title"] ?? ""}",
                                              style: TextStyle(
                                                  fontSize: size.width * 0.038,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              print(
                                                  "-=========${widget.quotation}");
                                              showDialog(
                                                  barrierDismissible: true,
                                                  context: context,
                                                  builder: (BuildContext
                                                          context) =>
                                                      Detailspopup(
                                                        title: widget.quotation[
                                                            index]["title"],
                                                        subject: widget
                                                                .quotation[
                                                            index]["subject"],
                                                        description: widget
                                                                        .quotation[
                                                                    index][
                                                                "description"] ??
                                                            "N/L",
                                                        date: widget.quotation[
                                                                index]
                                                            ["created_at"],
                                                        size: size,
                                                        onClick: () {
                                                          Get.to(() => DocShowScreen(
                                                              image: widget
                                                                          .quotation[
                                                                      index][
                                                                  "document_file"],
                                                              docType: widget
                                                                          .quotation[
                                                                      index][
                                                                  "file_type"]));
                                                        },
                                                      ));
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: size.height * 0.05,
                                              width: size.width * 0.2,
                                              decoration: BoxDecoration(
                                                color: AppColor.blue,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Text(
                                                "Details",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize:
                                                        size.width * 0.038),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: size.height * 0.01),
                                      Divider(
                                        thickness: 1,
                                        color: AppColor.grey,
                                      ),
                                      SizedBox(height: size.height * 0.01),
                                      Text(
                                        "Subject : ${widget.quotation[index]["subject"]}",
                                        style: TextStyle(
                                            fontSize: size.width * 0.038,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(height: size.height * 0.01),
                                      Text(
                                        "Reason :  ${widget.quotation[index]["cancel_reason"]}",
                                        style: TextStyle(
                                            fontSize: size.width * 0.038,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(height: size.height * 0.02),
                                      widget.quotation[index]
                                                  ["is_approve_by_user"] ==
                                              0
                                          ? Row(
                                              children: [
                                                Expanded(
                                                  child: CustomBtn(
                                                    size: size,
                                                    btnName: "Approve",
                                                    onClick: () {
                                                      showDialog(
                                                        barrierDismissible:
                                                            true,
                                                        context: context,
                                                        builder: (BuildContext
                                                                context) =>
                                                            CustomPopUpWidget(
                                                          size: size,
                                                          cancel: () {
                                                            Get.back();
                                                          },
                                                          done: () {
                                                            Navigator.pop(
                                                                context);
                                                            Get.snackbar(
                                                              "Hiiiiii",
                                                              "This is Approve success",
                                                              backgroundColor:
                                                                  AppColor.red,
                                                            );
                                                            homeController
                                                                .addCancelApproveApiCall(
                                                              userID: widget
                                                                  .quotation[
                                                                      index][
                                                                      "user_id"]
                                                                  .toString(),
                                                              jwt: global
                                                                  .userToken
                                                                  .toString(),
                                                              id: widget
                                                                      .quotation[
                                                                  index]["id"],
                                                              stetus: 1,
                                                            );
                                                          },
                                                          text:
                                                              "Accept Quatetion Say yes to start work.Do you agree.",
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child: CustomBtn(
                                                    size: size,
                                                    btnName: "Clarify",
                                                    onClick: () {
                                                      showDialog(
                                                          barrierDismissible:
                                                              true,
                                                          context: context,
                                                          builder: (BuildContext
                                                                  context) =>
                                                              CustomPopUpWidget(
                                                                controller:
                                                                    controller,
                                                                cancel: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                done: () {
                                                                  if (controller
                                                                      .text
                                                                      .isNotEmpty) {
                                                                    Get.back();
                                                                    Get.snackbar(
                                                                      "Hiiiiii",
                                                                      "This is clarify success",
                                                                      backgroundColor:
                                                                          AppColor
                                                                              .red,
                                                                    );
                                                                    homeController.addCancelApproveApiCall(
                                                                        userID: widget
                                                                            .quotation[index]
                                                                                [
                                                                                "user_id"]
                                                                            .toString(),
                                                                        jwt: global
                                                                            .userToken
                                                                            .toString(),
                                                                        id: widget.quotation[index]
                                                                            [
                                                                            "id"],
                                                                        resson: controller
                                                                            .text
                                                                            .toString(),
                                                                        stetus:
                                                                            2);
                                                                  } else {
                                                                    Get.snackbar(
                                                                      "Alert",
                                                                      "Enter All Form Filed",
                                                                      backgroundColor:
                                                                          AppColor
                                                                              .red,
                                                                    );
                                                                  }
                                                                },
                                                                size: size,
                                                                withTextFeiald:
                                                                    true,
                                                              ));
                                                    },
                                                  ),
                                                ),
                                              ],
                                            )
                                          : widget.quotation[index]
                                                      ["is_approve_by_user"] ==
                                                  1
                                              ? Text(
                                                  "Status :  APPROVED",
                                                  style: TextStyle(
                                                      fontSize:
                                                          size.width * 0.04,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: AppColor.green),
                                                )
                                              : widget.quotation[index][
                                                          "is_approve_by_user"] ==
                                                      2
                                                  ? Text(
                                                      "Status :  CANCELLED",
                                                      style: TextStyle(
                                                          fontSize:
                                                              size.width * 0.04,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: AppColor.red),
                                                    )
                                                  : Container()
                                    ],
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  )
                : Center(child: CustomEmpty(size: size)),
          ),
        ],
      ),
    );
  }
}
