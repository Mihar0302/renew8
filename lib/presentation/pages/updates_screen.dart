import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../models/stage_model.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_updates_widget.dart';
import 'doc_show_screen.dart';

class UpdatesScreen extends StatefulWidget {
  final List<StageData> notificationList;

  const UpdatesScreen({Key? key, required this.notificationList}) : super(key: key);

  @override
  State<UpdatesScreen> createState() => _UpdatesScreenState();
}

class _UpdatesScreenState extends State<UpdatesScreen> {
  String timedata({required String time}) {
    final DateFormat formatter = DateFormat('yMMMMEEEEd');
    final String formatted = formatter.format(DateTime.parse(time));
    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
              size: size,
              title: "Updates",
              onClick: () {
                Navigator.pop(context);
              }),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.01),
                  ListView.builder(
                    itemCount: widget.notificationList[0].data.length,
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, int i) {
                      return CustomUpdateWidget(
                        size: size,
                        onClick: () {
                          Get.to(
                            () => DocShowScreen(
                              image: widget.notificationList[0].data[i]['document'][0]['document_file'],
                              docType: widget.notificationList[0].data[i]["document"][0]['file_type'],
                            ),
                          );
                        },
                        description: "False celling completed in room",
                        onEdit: () {},
                        timeDate: timedata(
                          time: widget.notificationList[0].data[i]["updated_at"],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
