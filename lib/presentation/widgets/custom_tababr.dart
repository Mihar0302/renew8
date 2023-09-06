
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final Size size;
  final String textOne;
  final String textTwo;
  final String textThree;
  final Function onTapOne;
  final Function onTapTwo;
  final Function? onTapThree;
  final Color tabColorOne;
  final Color tabColorTwo;
  final Color? tabColorThree;
  final bool threeTabShow;

  const CustomTabBar({
    Key? key,
    required this.size,
    required this.textOne,
    required this.textTwo,
    required this.onTapOne,
    required this.onTapTwo,
    required this.tabColorOne,
    required this.tabColorTwo,
    this.onTapThree,
    this.tabColorThree,
    this.threeTabShow = false,
    this.textThree = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.017),
      child: Row(
        children: [
          SizedBox(width: size.width * 0.01),
          Expanded(
            child: InkWell(
              onTap: () {
                onTapOne();
              },
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.01),
                  Text(
                    textOne,
                    style: TextStyle(
                        letterSpacing: 0.34,
                        color: tabColorOne,
                        fontSize: size.width * 0.037,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: size.height * 0.008),
                  Container(
                    height: 2,
                    decoration: BoxDecoration(
                      color: tabColorOne,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: size.width * 0.01),
          Expanded(
            child: InkWell(
              onTap: () {
                onTapTwo();
              },
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.01),
                  Text(
                    textTwo,
                    style: TextStyle(
                        letterSpacing: 0.34,
                        color: tabColorTwo,
                        fontSize: size.width * 0.037,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: size.height * 0.008),
                  Container(
                    height: 2,
                    decoration: BoxDecoration(
                      color: tabColorTwo,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(width: size.width * 0.01),
          threeTabShow
              ? Expanded(
                  child: InkWell(
                    onTap: () {
                      onTapThree!();
                    },
                    child: Column(
                      children: [
                        SizedBox(height: size.height * 0.01),
                        Text(
                          textThree,
                          style: TextStyle(
                              letterSpacing: 0.34,
                              color: tabColorThree,
                              fontSize: size.width * 0.037,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: size.height * 0.008),
                        Container(
                          height: 2,
                          decoration: BoxDecoration(
                            color: tabColorThree,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : Container(),
          threeTabShow ? SizedBox(width: size.width * 0.01) : Container(),
        ],
      ),
    );
  }
}
