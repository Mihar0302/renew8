import 'package:flutter/material.dart';

class CustomPopUpWidget extends StatelessWidget {
  final Function cancel;
  final Function done;
  final String text;
  final Size size;

  const CustomPopUpWidget(
      {Key? key,
        required this.cancel,
        required this.done,
        required this.text,
        required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: EdgeInsets.only(
            top: size.height * 0.02,
            right: size.width * 0.015,
            left: size.width * 0.015,
            bottom: size.height * 0.005),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
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
                  child: const Text("Cancel"),
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                TextButton(
                  onPressed: () {
                    done();
                  },
                  child: const Text("Ok"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
