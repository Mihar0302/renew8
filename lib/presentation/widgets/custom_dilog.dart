import 'package:flutter/material.dart';
import 'package:ReNew8/presentation/widgets/custum_text_feild.dart';

class CustomPopUpWidget extends StatelessWidget {
  final Function cancel;
  final Function done;
  final String text;
  final Size size;
  final bool withTextFeiald;
  final TextEditingController? controller;

  const CustomPopUpWidget({
    Key? key,
    required this.cancel,
    required this.done,
    this.text = "",
    required this.size,
    this.withTextFeiald = false,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: EdgeInsets.only(
            top: size.height * 0.01,
            right: size.width * 0.015,
            left: size.width * 0.015,
            bottom: size.height * 0.005),
        child: withTextFeiald
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: size.height * 0.01),
                  Text(
                    "Subject :  Cost Of Full house modification",
                    style: TextStyle(
                        fontSize: size.width * 0.038,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Text(
                    "Reason :  Cost Of Full house modification Cost Of Full house modification Cost Of Full house modification",
                    style: TextStyle(
                        fontSize: size.width * 0.038,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: size.height * 0.02),
                  CustomTextFild(
                    max: true,
                    size: size,
                    hint: "Text here...",
                    controller: controller!,
                  ),
                  SizedBox(
                    height: size.height * 0.005,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          cancel();
                        },
                        child: const Text("No"),
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      TextButton(
                        onPressed: () {
                          done();
                        },
                        child: const Text("Yes"),
                      ),
                    ],
                  ),
                ],
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 180,
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.005,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          cancel();
                        },
                        child: const Text("No"),
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      TextButton(
                        onPressed: () {
                          done();
                        },
                        child: const Text("Yes"),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
