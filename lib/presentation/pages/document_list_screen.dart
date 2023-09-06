import 'package:ReNew8/presentation/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_image.dart';
import 'doc_show_screen.dart';

class DocumentListScreen extends StatelessWidget {
  final List data;
  final String title;

  const DocumentListScreen({
    super.key,
    required this.data,
    required this.title,
  });

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
              title: title),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Get.to(() => DocShowScreen(
                        image: data[index]["document_file"],
                        docType: data[index]["file_type"],
                      ));
                },
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        image: data[index]["file_type"] == "doc"
                            ? const DecorationImage(
                                image: AssetImage(AppImages.pdf),
                                fit: BoxFit.cover)
                            : DecorationImage(
                                image:
                                    NetworkImage(data[index]["document_file"]),
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ],
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            padding: const EdgeInsets.all(15),
            shrinkWrap: true,
          )
        ],
      ),
    );
  }
}
