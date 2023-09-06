import 'package:ReNew8/presentation/pages/sub_stage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ReNew8/presentation/widgets/custom_appbar.dart';
import 'package:ReNew8/utils/app_image.dart';

import 'doc_show_screen.dart';

class JobDescriptionScreen extends StatefulWidget {
  final List<DocData> doc;

  const JobDescriptionScreen({
    Key? key,
    required this.doc,
  }) : super(key: key);

  @override
  State<JobDescriptionScreen> createState() => _JobDescriptionScreenState();
}

class _JobDescriptionScreenState extends State<JobDescriptionScreen> {
  @override
  void initState() {
    debugPrint("--------- >>> ${widget.doc.toString()}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              size: size,
              onClick: () {
                Get.back();
              },
              title: 'Document',
            ),
            SizedBox(height: size.height * 0.01),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.doc.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Get.to(() => DocShowScreen(
                          image: widget.doc[index].doc,
                          docType: widget.doc[index].docType,
                        ));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10),
                      image: widget.doc[index].docType != "image"
                          ? const DecorationImage(
                              image: AssetImage(AppImages.pdf),
                              fit: BoxFit.cover)
                          : DecorationImage(
                              image: NetworkImage(widget.doc[index].doc),
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              padding: const EdgeInsets.all(10),
              shrinkWrap: true,
            ),
            // CustomBtn(size: size, btnName: "bddtnName", onClick: () {}),
          ],
        ),
      ),
    );
  }
}

// class Details extends StatelessWidget {
//   final Size size;
//   final String description;
//   final String qty;
//   final String index;
//
//   const Details({
//     super.key,
//     required this.size,
//     required this.description,
//     required this.qty,
//     required this.index,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: size.height * 0.001),
//       padding: EdgeInsets.symmetric(
//           vertical: size.height * 0.005, horizontal: size.width * 0.02),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Row(
//         children: [
//           Text(
//             index,
//             style: TextStyle(
//               fontSize: size.width * 0.036,
//               color: AppColor.grey,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//           SizedBox(width: size.width * 0.03),
//           Text(
//             description,
//             style: TextStyle(
//               fontSize: size.width * 0.036,
//               color: AppColor.grey,
//               fontWeight: FontWeight.w400,
//             ),
//           ),
//           Expanded(child: Container()),
//           Text(
//             qty,
//             style: TextStyle(
//               fontSize: size.width * 0.036,
//               fontWeight: FontWeight.w400,
//               color: AppColor.grey,
//             ),
//           ),
//           SizedBox(width: size.width * 0.05),
//         ],
//       ),
//     );
//   }
// }
