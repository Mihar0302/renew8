import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ReNew8/controller/global_controller.dart';

import '../helper/http_helper.dart';
import '../models/add_cancel_data.dart';
import '../models/approvals_data.dart';
import '../models/login_model.dart';
import '../models/stage_model.dart';
import '../presentation/pages/home_screen.dart';

class HomeController extends GetxController {
  final GlobalController global = Get.find();
  RxInt tab = 0.obs;
  List<StageData> stageList = [];
  List<StageData> notificationList = [];
  List<StageDataApproval> approvalsList = [];
  List<StageData> cameraList = [];
  List<StageData> quotationFilterList = [];
  List<StageData> individualList = [];
  List<StageData> messageUpdates = [];
  List<StageData> helpData = [];
  List reportAnswer = [];

  RxBool loading = false.obs;
  RxInt totalsum = 0.obs;
  RxBool totalsumdata = true.obs;

  stageListApiCall() async {
    loading.value = true;
    stageList.clear();
    StageData? stageData = await HttpHelper.userStageListApi(
        userId: global.userId.value.toString(), jwt: global.userToken.value);
    if (stageData != null) {
      stageList.add(stageData);
      debugPrint(
          "stageListApiCall======> > > > > >${stageList[0].data.length}");
    }
    loading.value = false;
  }

  individualapicall() async {
    individualList.clear();
    loading.value = true;
    StageData? stageData = await HttpHelper.individulDocApi(
        userId: global.userId.value.toString(), jwt: global.userToken.value);
    if (stageData != null) {
      individualList.add(stageData);
      debugPrint(
          "Individual List Call ======> > > > > >${individualList[0].data}");
    }
    loading.value = false;
  }

  notificationListApiCall() async {
    loading.value = true;
    notificationList.clear();
    StageData? stageData = await HttpHelper.notificationListApi(
      userId: global.userId.value.toString(),
      jwt: global.userToken.value,
    );
    if (stageData != null) {
      notificationList.add(stageData);
    }
    loading.value = false;
  }

  RxBool approvalsLoading = false.obs;

  approvalsListApiCall() async {
    approvalsList.clear();
    approvalsLoading.value = true;
    StageDataApproval? stageDataApproval = await HttpHelper.approvalsListApi(
      userId: global.userId.value.toString(),
    );
    if (stageDataApproval != null) {
      approvalsList.add(stageDataApproval);
    }
    debugPrint("===>approvalsListApiCall ====> ${approvalsList.length} ");
    approvalsLoading.value = false;
  }

  RxBool cameraLoading = false.obs;

  cameraListApiCall() async {
    cameraLoading.value = true;
    cameraList.clear();
    StageData? stageData = await HttpHelper.cameraListApi(
      userId: global.userId.value.toString(),
      jwt: global.userToken.value,
    );
    if (stageData != null) {
      cameraList.add(stageData);
    }
    cameraLoading.value = false;
  }

  RxBool quotationLoading = false.obs;
  List<StageData> quotationList = [];

  quotationApiCall() async {
    quotationList.clear();
    quotationLoading.value = true;
    StageData? stageData = await HttpHelper.quotationApi(
      userId: global.userId.value.toString(),
      jwt: global.userToken.value,
    );
    debugPrint("--->>> STAGE DATA + >> ${stageData?.data}");
    if (stageData != null) {
      quotationList.add(
          stageData); // quotationList.addAll(quotationList[0].data.toList());
    }
    quotationLoading.value = false;
  }

  addCancelApproveApiCall(
      {required String userID,
      required int id,
      required int stetus,
      resson,
      jwt}) async {
    Login? addCancelData = await HttpHelper.addCancelApproveApi(
      approveID: id,
      approveStatus: stetus,
      cancelReason: resson,
      jwt: jwt.toString(),
      userId: global.userId.value.toString(),
    ).then((value) => Get.offAll(() => const HomeScreen()));

    if (addCancelData != null) {
      print("----------->>>>>>>>> HOME PAGE NAVIHARE");
    }
  }

  messsageApiCall() async {
    messageUpdates.clear();
    StageData? stageData = await HttpHelper.messageApi(
        userId: global.userId.value.toString(), jwt: global.userToken.value);
    if (stageData != null) {
      messageUpdates.add(stageData);
    }
  }

  reportAnswerApiCall() async {
    reportAnswer.clear();
    StageData? stageData = await HttpHelper.reportAnswer(
        userId: global.userId.value.toString(), jwt: global.userToken.value);
    if (stageData != null) {
      reportAnswer = stageData.data;
    }
  }

  helpApiCall() async {
    helpData.clear();
    StageData? stageData = await HttpHelper.helpApi(
        userId: global.userId.value.toString(), jwt: global.userToken.value);
    if (stageData != null) {
      helpData.add(stageData);
    }
  }

  RxBool loding = false.obs;

  reportConcernApiCall(
      {required File document, required Map<String, dynamic> body}) async {
    loding.value = true;
    await HttpHelper.uploadFileApiCall(document, body, global.userToken.value);
    loding.value = true;
  }
}
