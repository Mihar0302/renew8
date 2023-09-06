import 'package:ReNew8/controller/global_controller.dart';
import 'package:ReNew8/controller/home_controller.dart';
import 'package:ReNew8/presentation/pages/report_concern.dart';
import 'package:ReNew8/presentation/widgets/custom_empty.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ReNew8/presentation/widgets/custom_appbar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mime/mime.dart';
import '../../utils/app_color.dart';
import '../widgets/details_dailog.dart';
import 'doc_show_screen.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  HomeController homeController = Get.find();
  GlobalController globalController = Get.find();

  RxBool loading = false.obs;

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            size: size,
            onClick: () {
              Navigator.pop(context);
            },
            title: "Report Concern",
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.height * 0.03, left: size.width * 0.03),
            child: InkWell(
              onTap: () {
                Get.to(() => const ReportConcern());
              },
              child: Text(
                "Create Report",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.045,
                  color: AppColor.blue,
                ),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.03),
          Expanded(
            child: Obx(
              () => !loading.value
                  ? ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: homeController.reportAnswer.length,
                      itemBuilder: (context, int i) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.01,
                            horizontal: size.width * 0.03,
                          ),
                          margin: EdgeInsets.symmetric(
                              horizontal: size.width * 0.05,
                              vertical: size.height * 0.01),
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: size.width * 0.6,
                                child: Text(
                                  homeController.reportAnswer[i]["subject"],
                                  style: TextStyle(
                                      fontSize: size.width * 0.038,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  showDialog(
                                      barrierDismissible: true,
                                      context: context,
                                      builder: (BuildContext context) =>
                                          Detailspopup(
                                            answer: true,
                                            title: homeController
                                                .reportAnswer[i]["subject"],
                                            subject: homeController
                                                .reportAnswer[i]["description"],
                                            description:
                                                homeController.reportAnswer[i]
                                                        ["answer"] ??
                                                    "N/L",
                                            date: timedata(
                                              time:
                                                  homeController.reportAnswer[i]
                                                      ["created_at"],
                                            ),
                                            size: size,
                                            onClick: () {
                                              String? mimeStr = lookupMimeType(
                                                  homeController.reportAnswer[i]
                                                      ["document_file"]);
                                              var fileType =
                                                  mimeStr!.split('/');
                                              Get.to(() => DocShowScreen(
                                                  image: homeController
                                                          .reportAnswer[i]
                                                      ["answer_document_file"],
                                                  docType: fileType.last));
                                            },
                                          ));
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: size.height * 0.04,
                                  width: size.width * 0.2,
                                  decoration: BoxDecoration(
                                    color: AppColor.blue.withOpacity(0.6),
                                    borderRadius: BorderRadius.circular(7),
                                  ),
                                  child: Text(
                                    "Details",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: size.width * 0.038),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  : CustomEmpty(size: size),
            ),
          )
        ],
      ),
    );
  }
}
