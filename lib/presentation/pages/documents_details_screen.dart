import 'package:flutter/material.dart';
import 'package:ReNew8/utils/app_color.dart';

class DocumentsDetailsScreen extends StatelessWidget {
  const DocumentsDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            GridView.builder(
              itemCount: 2,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, int i) {
                return Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: size.width * 0.01,
                  ),
                  height: size.height * 0.01,
                  width: size.width * 0.02,
                  color: AppColor.primaryColor,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
