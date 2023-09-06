import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/app_color.dart';
import '../../utils/app_image.dart';

class CustomTextFild extends StatelessWidget {
  final Size size;
  final String hint;
  final bool whit;
  final bool cngsize;
  final bool margin;
  final bool max;
  final bool obsertext;
  final TextEditingController controller;
  final Function? onChange;
  final Widget? button;
  final bool numberKeyboard;
  final List<TextInputFormatter>? inputFormatter;
  final TextInputType? inputType;
  final String img;

  const CustomTextFild(
      {Key? key,
      required this.size,
      required this.hint,
      required this.controller,
      this.whit = false,
      this.cngsize = false,
      this.margin = false,
      this.onChange,
      this.max = false,
      this.obsertext = false,
      this.button,
      this.numberKeyboard = false,
      this.inputFormatter,
      this.inputType,
      this.img = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: margin
          ? EdgeInsets.symmetric(horizontal: size.width * 0.05)
          : EdgeInsets.symmetric(horizontal: size.width * 0.01),
      padding: max
          ? EdgeInsets.symmetric(
              vertical: size.height * 0.01, horizontal: size.width * 0.01)
          : EdgeInsets.symmetric(
              vertical: size.height * 0.00, horizontal: size.width * 0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColor.grey.withOpacity(0.3),
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          img.isNotEmpty
              ? Image.asset(AppImages.logo,
                  height: size.height * 0.03, fit: BoxFit.contain)
              : Container(),
          img.isNotEmpty ? SizedBox(width: size.width * 0.01) : Container(),
          Expanded(
            child: TextField(
              cursorColor: AppColor.primaryColor,
              autofocus: false,
              autocorrect: true,
              autofillHints: const [AutofillHints.countryCode],
              keyboardType: numberKeyboard
                  ? TextInputType.number
                  : TextInputType.emailAddress,
              inputFormatters: inputFormatter,
              obscureText: obsertext,
              maxLines: max ? 5 : 1,
              textAlign: cngsize ? TextAlign.center : TextAlign.start,
              controller: controller,
              style: TextStyle(
                fontSize: size.width * 0.04,
                color: AppColor.black,
              ),
              onChanged: (String value) {
                if (onChange != null) {
                  onChange!();
                }
              },
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(
                  fontSize: size.width * 0.04,
                  color: AppColor.black,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          if (button != null) button!,
        ],
      ),
    );
  }
}
