import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/app_image.dart';
import '../../utils/route_string.dart';

class CustomDocWidget extends StatelessWidget {
  final Size size;
  final String label;

  CustomDocWidget({
    Key? key,
    required this.size,
    required this.label,
  }) : super(key: key);

  final List<String> labelData = [
    "Image",
    "Pdf",
    "Image",
    "Pdf",
    "Image",
    "Pdf",
  ];
  final List<String> labelDataImage = [
    AppImages.ads,
    AppImages.pdf,
    AppImages.ads,
    AppImages.pdf,
    AppImages.ads,
    AppImages.pdf,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          child: Text(
            label,
            style: TextStyle(
              fontSize: size.width * 0.04,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: size.height * 0.015),
        SizedBox(
          height: size.height * 0.16,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.03,
            ),
            itemCount: 6,
            shrinkWrap: true,
            itemBuilder: (context, int i) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouteString.DOC_SHOW_SCRREN,
                      arguments: labelDataImage[i]);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: size.width * 0.02,
                  ),
                  height: size.height * 0.15,
                  width: size.width * 0.3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        labelDataImage[i],
                      ),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.grey,
                        blurRadius: 5,
                        offset: const Offset(0.5, 0.5),
                      )
                    ],
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: size.height * 0.05,
                        width: size.width * 0.3,
                        decoration: BoxDecoration(
                          color: AppColor.primaryColor.withOpacity(0.5),
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            labelData[i],
                            style: TextStyle(
                              color: AppColor.white,
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: size.height * 0.04),
      ],
    );
  }
}
