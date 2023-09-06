import 'dart:io';

import 'package:ReNew8/controller/global_controller.dart';
import 'package:ReNew8/controller/home_controller.dart';
import 'package:ReNew8/presentation/widgets/custom_appbar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mime/mime.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../utils/app_color.dart';
import '../../utils/app_image.dart';
import '../widgets/app_methods.dart';
import '../widgets/custom_btn.dart';
import '../widgets/custum_text_feild.dart';

class ReportConcern extends StatefulWidget {
  const ReportConcern({super.key});

  @override
  State<ReportConcern> createState() => _ReportConcernState();
}

class _ReportConcernState extends State<ReportConcern> {
  HomeController homeController = Get.find();
  GlobalController global = Get.find();
  TextEditingController subject = TextEditingController();
  TextEditingController message = TextEditingController();
  RxString document = "".obs;
  RxString docType = "".obs;

  filePick() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
    );
    document.value = result!.paths.first!;
    String? mimeStr = lookupMimeType(document.value);
    var fileType = mimeStr!.split('/');
    docType.value = fileType.last;
    debugPrint("==> val ====> ${docType.value}");
  }

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
            title: "Create Report",
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.04),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Text(
                      "Report Concern",
                      style: TextStyle(
                        fontSize: size.width * 0.047,
                        fontWeight: FontWeight.bold,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  CustomTextFild(
                    margin: true,
                    size: size,
                    hint: "Subject",
                    controller: subject,
                  ),
                  SizedBox(height: size.height * 0.02),
                  CustomTextFild(
                    margin: true,
                    size: size,
                    hint: "Drop message here",
                    controller: message,
                    max: true,
                  ),
                  SizedBox(height: size.height * 0.02),
                  Obx(
                    () => document.value.isNotEmpty
                        ? docType.value == "pdf"
                            ? SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: size.height * 0.65,
                                      width: size.width,
                                      child: SfPdfViewer.file(
                                        scrollDirection:
                                            PdfScrollDirection.vertical,
                                        File(document.value),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.05),
                                padding: EdgeInsets.symmetric(
                                    vertical: size.height * 0.02),
                                height: size.height * 0.16,
                                width: size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColor.grey.withOpacity(0.4),
                                  image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: FileImage(
                                      File(
                                        document.value,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                        : InkWell(
                            onTap: () {
                              filePick();
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.05),
                              padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.02),
                              height: size.height * 0.16,
                              width: size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.grey.withOpacity(0.4),
                              ),
                              child: Column(
                                children: [
                                  Image.asset(AppImages.docs,
                                      height: size.height * 0.06,
                                      color: AppColor.grey),
                                  Expanded(child: Container()),
                                  Text(
                                    "Add Document here...",
                                    style: TextStyle(
                                        color: AppColor.grey,
                                        fontSize: size.width * 0.038),
                                  )
                                ],
                              ),
                            ),
                          ),
                  ),
                  SizedBox(height: size.height * 0.28),
                  CustomBtn(
                    size: size,
                    btnName: "Send report",
                    onClick: () {
                      if (subject.text.isNotEmpty || message.text.isNotEmpty) {
                        homeController.reportConcernApiCall(
                            document: File(document.value),
                            body: {
                              "user_id": global.userId.value,
                              "subject": subject.text,
                              "description": message.text,
                            });
                        Get.back();
                      } else {
                        Methods.showSnack(
                            "Alert", "Please Enter Subject and message !");
                      }
                    },
                  ),
                  SizedBox(height: size.height * 0.03),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
