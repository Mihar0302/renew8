import 'package:ReNew8/presentation/pages/document_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ReNew8/utils/app_color.dart';
import 'package:ReNew8/utils/app_image.dart';

import '../../controller/home_controller.dart';
import '../widgets/custom_empty.dart';
import 'doc_show_screen.dart';
import 'job_description_screen.dart';

class DocumentsScreen extends StatefulWidget {
  final HomeController homeController;

  const DocumentsScreen({Key? key, required this.homeController})
      : super(key: key);

  @override
  State<DocumentsScreen> createState() => _DocumentsScreenState();
}

class _DocumentsScreenState extends State<DocumentsScreen> {
  RxBool loading = false.obs;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0)).then((value) async {
      loading.value = true;
      await widget.homeController.individualapicall();
      loading.value = false;
    });

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
                  SizedBox(height: size.height * 0.03),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: size.width * 0.05),
                    child: Text(
                      "Documents",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: size.width * 0.042),
                    ),
                  ),
                  SizedBox(height: size.height * 0.003),
                  widget.homeController.individualList.isNotEmpty
                      // ? ListView.builder(
                      //     padding: EdgeInsets.zero,
                      //     itemCount: widget
                      //         .homeController.individualList[0].data.length,
                      //     physics: const NeverScrollableScrollPhysics(),
                      //     shrinkWrap: true,
                      //     scrollDirection: Axis.vertical,
                      //     itemBuilder: (context, int index) {
                      //       return InkWell(
                      //         onTap: () {
                      //           debugPrint(
                      //               "=================${widget.homeController.individualList[0].data[index]["document"][index]["file_type"]}");
                      //           debugPrint(
                      //             widget.homeController.individualList[0]
                      //                 .data[index]
                      //                 .toString(),
                      //           );
                      //           Get.to(() => DocShowScreen(
                      //                 image: widget.homeController
                      //                         .individualList[0].data[index]
                      //                     ['document'][index]["document_file"],
                      //                 docType: widget.homeController
                      //                         .individualList[0].data[index]
                      //                     ["document"][index]["file_type"],
                      //               ));
                      //           // Get.to(() => JobDescriptionScreen(
                      //           //       doc: widget.homeController
                      //           //               .individualList[0].data[index]
                      //           //           ['document'][index]["document_file"],
                      //           //       doctype: widget.homeController
                      //           //               .individualList[0].data[index]
                      //           //           ["document"][index]["file_type"],
                      //           //     ));
                      //         },
                      //         child: ListWidget(
                      //           size: size,
                      //           img: AppImages.ads,
                      //           titel: widget.homeController.individualList[0]
                      //               .data[index]['title'],
                      //           decription: widget
                      //               .homeController
                      //               .individualList[0]
                      //               .data[index]["description"]
                      //               .toString(),
                      //         ),
                      //       );
                      //     },
                      //   )
                      ? GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: widget
                              .homeController.individualList[0].data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Get.to(() => DocumentListScreen(
                                    data: widget
                                        .homeController
                                        .individualList[0]
                                        .data[index]["document"],
                                    title: widget
                                        .homeController
                                        .individualList[0]
                                        .data[index]["category"]));
                                // Get.to(() => DocShowScreen(
                                //       image: widget.homeController
                                //               .individualList[0].data[index]
                                //           ['document'][index]["document_file"],
                                //       docType: widget.homeController
                                //               .individualList[0].data[index]
                                //           ['document'][index]["file_type"],
                                //     ));
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(10),
                                        image: const DecorationImage(
                                            image: AssetImage(
                                          AppImages.docs,
                                        ))
                                        // image: widget
                                        //                 .homeController
                                        //                 .individualList[0]
                                        //                 .data[index]['document']
                                        //             [index]["file_type"] ==
                                        //         "doc"
                                        //     ? const DecorationImage(
                                        //         image: AssetImage(AppImages.pdf),
                                        //         fit: BoxFit.cover)
                                        //     : DecorationImage(
                                        //         image: NetworkImage(widget
                                        //                 .homeController
                                        //                 .individualList[0]
                                        //                 .data[index]['document']
                                        //             [index]["document_file"]),
                                        //         fit: BoxFit.cover,
                                        //       ),
                                        ),
                                  ),
                                  Text(
                                    widget.homeController.individualList[0]
                                        .data[index]["category"],
                                    style: TextStyle(
                                      fontSize: size.width * 0.038,
                                    ),
                                  ),
                                ],
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
                        )
                      : Center(child: CustomEmpty(size: size))
                ],
              ),
            ),
    );
  }
}

class ListWidget extends StatelessWidget {
  final Size size;
  final String img;
  final String titel;
  final String decription;

  const ListWidget(
      {super.key,
      required this.size,
      required this.img,
      required this.titel,
      required this.decription});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
              vertical: size.height * 0.015, horizontal: size.width * 0.05),
          height: size.height * 0.13,
          width: size.width,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: AppColor.grey.withOpacity(0.5),
                offset: const Offset(0.5, 1),
              )
            ],
            color: AppColor.primaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.01,
                  horizontal: size.width * 0.027,
                ),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "View",
                  style: TextStyle(fontSize: size.width * 0.04),
                ),
              ),
              SizedBox(width: size.width * 0.03),
            ],
          ),
        ),
        // Container(
        //   margin: EdgeInsets.symmetric(
        //       vertical: size.height * 0.015, horizontal: size.width * 0.05),
        //   height: size.height * 0.13,
        //   width: size.width,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(10),
        //     gradient: LinearGradient(
        //       begin: Alignment.centerRight,
        //       end: Alignment.centerLeft,
        //       colors: [
        //         AppColor.white.withOpacity(0.2),
        //         AppColor.primaryColor,
        //       ],
        //     ),
        //   ),
        // ),
        Positioned(
          top: size.height * 0.04,
          left: size.width * 0.08,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titel,
                style: TextStyle(
                  color: AppColor.white,
                  fontSize: size.width * 0.048,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              SizedBox(
                width: size.width * 0.7,
                child: Text(
                  decription,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: size.width * 0.035,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
