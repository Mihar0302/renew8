import 'package:flutter/material.dart';
import 'package:ReNew8/presentation/widgets/custom_appbar.dart';
import 'package:ReNew8/presentation/widgets/text_container.dart';

import '../../utils/app_color.dart';
import '../../utils/app_image.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController siteAddress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            size: size,
            onClick: () {},
            title: 'Profile',
          ),
          Stack(
            children: [
              Container(
                height: size.height * 0.25,
                width: size.width * 0.25,
                decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    shape: BoxShape.circle,
                    image: const DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(AppImages.userimg),
                    )),
              ),
              Positioned(
                bottom: size.height * 0.05,
                right: 0,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    height: size.height * 0.07,
                    width: size.width * 0.07,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColor.primaryColor,
                    ),
                    child: Icon(
                      Icons.edit,
                      size: size.height * 0.02,
                      color: AppColor.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: size.height * 0.01),
          TextContainer(size: size, text: "First Name"),
          SizedBox(height: size.height * 0.02),
          TextContainer(size: size, text: "Last Name"),
          SizedBox(height: size.height * 0.02),
          TextContainer(size: size, text: "Email Address"),
          SizedBox(height: size.height * 0.02),
          TextContainer(size: size, text: "Mobile Number"),
          SizedBox(height: size.height * 0.02),
          TextContainer(size: size, text: "Sex"),
          SizedBox(height: size.height * 0.02),
          TextContainer(size: size, text: "Sire Address"),
        ],
      ),
    );
  }
}
