import 'package:flutter/material.dart';
import 'package:ReNew8/presentation/widgets/custom_appbar.dart';
import 'package:ReNew8/utils/app_color.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

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
            title: "May i help you",
          ),
          SizedBox(height: size.height * 0.04),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Text(
              "May i help you",
              style: TextStyle(
                fontSize: size.width * 0.047,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor,
              ),
            ),
          ),
          SizedBox(height: size.height * 0.012),
          Center(
            child: SizedBox(
              width: size.width * 0.9,
              child: Text(
                "Contrary to popular belief, L"
                "orem Ipsum is not simply random text. It has roo"
                "ts in a piece of classical Latin literature from 45 BC, making it over 200"
                "0 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in V"
                "irginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "
                " (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. "
                "The first line of Lorem Ipsum,  comes from a line in section 1.10.32.",
                style: TextStyle(
                  fontSize: size.width * 0.04,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
