import 'package:ReNew8/presentation/widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Detailspopup extends StatelessWidget {
  final String title;
  final String subject;
  final String description;
  final String date;
  final Size size;
  final Function onClick;
  final bool answer;

  const Detailspopup({
    Key? key,
    required this.title,
    required this.subject,
    required this.description,
    required this.date,
    required this.size,
    required this.onClick,
    this.answer = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: EdgeInsets.only(
            top: size.height * 0.01,
            right: 10,
            left: 10,
            bottom: size.height * 0.005),
        child: answer
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Details",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 15),
                  RowTest(size: size, title: "Subject", text: title),
                  const SizedBox(height: 20),
                  RowTest(size: size, title: "Description", text: subject),
                  const SizedBox(height: 2),
                  RowTest(size: size, title: "Answer", text: description),
                  const SizedBox(height: 10),
                  RowTest(size: size, title: "Date", text: date),
                  const SizedBox(height: 40),
                  CustomBtn(
                    size: size,
                    btnName: "Check Document",
                    onClick: () {
                      Get.back();
                      onClick();
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text("Done"),
                      ),
                    ],
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Details",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 30),
                  RowTest(size: size, title: "Title", text: title),
                  const SizedBox(height: 12),
                  RowTest(size: size, title: "Subject", text: subject),
                  const SizedBox(height: 2),
                  RowTest(size: size, title: "Description", text: description),
                  const SizedBox(height: 2),
                  RowTest(size: size, title: "Date", text: date),
                  const SizedBox(height: 30),
                  CustomBtn(
                    size: size,
                    btnName: "Check Document",
                    onClick: () {
                      Get.back();
                      onClick();
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text("Done"),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}

class RowTest extends StatelessWidget {
  final Size size;
  final String title;
  final String text;

  const RowTest(
      {Key? key, required this.size, required this.title, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.7,
      child: Row(
        children: [
          Text(
            "$title :",
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: size.height * 0.02, fontWeight: FontWeight.w400),
          ),
          SizedBox(width: size.width * 0.02),
          Expanded(
            child: Text(
              text,
              maxLines: 20,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: size.height * 0.02,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
