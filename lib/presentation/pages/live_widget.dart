import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ReNew8/controller/home_controller.dart';
import 'package:ReNew8/presentation/pages/live_view_screen.dart';

import '../widgets/custom_empty.dart';

class LiveWidget extends StatefulWidget {
  final HomeController homeController;

  const LiveWidget({Key? key, required this.homeController}) : super(key: key);

  @override
  State<LiveWidget> createState() => _LiveWidgetState();
}

RxBool loading = false.obs;

class _LiveWidgetState extends State<LiveWidget> {
  final HomeController homeController = Get.find();

  @override
  void initState() {
    Future.delayed(Duration(seconds: 0)).then((value) async {
      loading.value = true;
      await homeController.cameraListApiCall();
      loading.value = false;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return const Center(child: Text("Coming Soon.."));
    // return Obx(
    //   () => loading.value
    //       ? const Center(child: CircularProgressIndicator())
    //       : homeController.cameraList.isNotEmpty
    //           ? SingleChildScrollView(
    //               child: Column(
    //                 children: [
    //                   SizedBox(height: size.height * 0.03),
    //                   SizedBox(
    //                     height: size.height * 0.5,
    //                     child: GridView.builder(
    //                         gridDelegate:
    //                             const SliverGridDelegateWithFixedCrossAxisCount(
    //                           crossAxisCount: 2,
    //                         ),
    //                         itemCount: homeController.cameraList.length,
    //                         itemBuilder: (BuildContext context, int index) {
    //                           return InkWell(
    //                             onTap: () {
    //                               Get.to(() => LiveViewScreen(
    //                                     url: homeController.cameraList[0]
    //                                         .data[index]["camera_url"],
    //                                   ));
    //                             },
    //                             child: Card(
    //                               margin: const EdgeInsets.all(10),
    //                               color: Colors.amber,
    //                               child: Center(child: Text('${index + 1}')),
    //                             ),
    //                           );
    //                         }),
    //                   ),
    //                 ],
    //               ),
    //             )
    //           : Center(child: CustomEmpty(size: size)),
    // );
  }
}
