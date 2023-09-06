import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as part1;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ReNew8/helper/shared_pref_helper.dart';

import '../controller/home_controller.dart';
import '../models/approvals_data.dart';
import '../models/login_model.dart';
import '../models/stage_model.dart';
import '../presentation/widgets/app_methods.dart';

class HttpHelper {
  HomeController homeController = HomeController();

  static final http.Client _client = http.Client();

  /// LOGIN API CALL ///

  static Future<Login?> loginApi({
    required String userName,
    required String password,
    required String token,
  }) async {
    try {
      final SharedPreferencesHelper prefs = SharedPreferencesHelper(
        pref: await SharedPreferences.getInstance(),
      );
      final response = await _client.post(
        Uri.parse("https://adminpanel.holzteller.com/public/api/login"),
        body: {
          "username": userName,
          "password": password,
          "device_type": "a",
          "device_token": token,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        prefs.setUserToken(jsonDecode(response.body)["data"]["token"]);
        prefs.setUserId(jsonDecode(response.body)["data"]["id"]);
        prefs.setUserName(jsonDecode(response.body)["data"]["first_name"] +
            jsonDecode(response.body)["data"]["last_name"]);
        return Login.fromJson(jsonDecode(response.body));
      } else {
        Methods.showSnack("Alert", jsonDecode(response.body)["message"]);

        return null;
      }
    } catch (e) {
      debugPrint("=====>  Error login Api===> $e");
      Methods.showSnack("Alert", e.toString());
      return null;
    }
  }

  static Future<StageData?> userStageListApi({
    required String userId,
    required String jwt,
  }) async {
    try {
      final response = await _client.post(
        Uri.parse(
            "https://adminpanel.holzteller.com/public/api/userwisestagelist"),
        body: jsonEncode({
          "user_id": userId,
        }),
        headers: {
          "Content-Type": "application/json",
          "Access-Token": jwt,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        log("===>userStageListApi  === = > ${response.body}");
        return StageData.fromJson(jsonDecode(response.body));
      } else {
        Methods.showSnack("Alert", jsonDecode(response.body)["message"]);

        return null;
      }
    } catch (e) {
      debugPrint("=====>  Error login Api===> $e");
      Methods.showSnack("Alert", e.toString());
      return null;
    }
  }

  static Future<StageData?> individulDocApi({
    required String userId,
    required String jwt,
  }) async {
    try {
      final response = await _client.post(
        Uri.parse(
            "https://adminpanel.holzteller.com/public/api/individualupdatedocumentlist"),
        body: jsonEncode({
          "user_id": userId,
        }),
        headers: {
          "Content-Type": "application/json",
          "Access-Token": jwt,
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return StageData.fromJson(jsonDecode(response.body));
      } else {
        Methods.showSnack("Alert", jsonDecode(response.body)["message"]);

        return null;
      }
    } catch (e) {
      debugPrint("=====>  Error login Api===> $e");
      Methods.showSnack("Alert", e.toString());
      return null;
    }
  }

  static Future<StageData?> cameraListApi({
    required String userId,
    required String jwt,
  }) async {
    try {
      final response = await _client.post(
        Uri.parse(
            "https://adminpanel.holzteller.com/public/api/userwisecameralist"),
        body: jsonEncode({
          "user_id": userId,
        }),
        headers: {
          "Content-Type": "application/json",
          "Access-Token": jwt,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // debugPrint("===>cameraListApi ====>  ${response.body}");
        return StageData.fromJson(jsonDecode(response.body));
      } else {
        Methods.showSnack("Alert", jsonDecode(response.body)["message"]);

        return null;
      }
    } catch (e) {
      debugPrint("=====>  Error login Api===> $e");
      Methods.showSnack("Alert", e.toString());
      return null;
    }
  }

  static Future<StageData?> notificationListApi({
    required String userId,
    required String jwt,
  }) async {
    try {
      final response = await _client.post(
        Uri.parse(
            "https://adminpanel.holzteller.com/public/api/notificationlist"),
        body: jsonEncode({
          "user_id": userId,
        }),
        headers: {
          "Content-Type": "application/json",
          "Access-Token": jwt,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("===>notificationListApi   ${jsonDecode(response.body)}");
        return StageData.fromJson(jsonDecode(response.body));
      } else {
        Methods.showSnack("Alert", jsonDecode(response.body)["message"]);

        return null;
      }
    } catch (e) {
      debugPrint("=====>  Error login Api===> $e");
      Methods.showSnack("Alert", e.toString());
      return null;
    }
  }

  static Future<StageDataApproval?> approvalsListApi({
    required String userId,
  }) async {
    final response = await _client.post(
      Uri.parse("https://adminpanel.holzteller.com/public/api/approvetypeapi"),
      body: jsonEncode({
        "user_id": "115",
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return StageDataApproval.fromJson(jsonDecode(response.body));
    } else {
      Methods.showSnack("Alert", jsonDecode(response.body)["message"]);
      return null;
    }
  }

  static Future<StageData?> quotationApi({
    required String userId,
    required String jwt,
  }) async {
    try {
      final response = await _client.post(
        Uri.parse("https://adminpanel.holzteller.com/public/api/approvallist"),
        body: jsonEncode({
          "user_id": userId,
        }),
        headers: {
          "Content-Type": "application/json",
          "Access-Token": jwt,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return StageData.fromJson(jsonDecode(response.body));
      } else {
        Methods.showSnack("Alert", jsonDecode(response.body)["message"]);
        return null;
      }
    } catch (e) {
      debugPrint("=====>  Error quotationApi Api===> $e");
      Methods.showSnack("Alert", e.toString());
      return null;
    }
  }

  static Future<StageData?> messageApi({
    required String userId,
    required String jwt,
  }) async {
    try {
      final response = await _client.post(
        Uri.parse(
            "https://adminpanel.holzteller.com/public/api/individualmessageslist"),
        body: jsonEncode({
          "user_id": userId,
        }),
        headers: {
          "Content-Type": "application/json",
          "Access-Token": jwt,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return StageData.fromJson(jsonDecode(response.body));
      } else {
        Methods.showSnack("Alert", jsonDecode(response.body)["message"]);
        return null;
      }
    } catch (e) {
      debugPrint("=====>  Error quotationApi Api===> $e");
      Methods.showSnack("Alert", e.toString());
      return null;
    }
  }

  static Future<StageData?> helpApi({
    required String userId,
    required String jwt,
  }) async {
    try {
      final response = await _client.post(
        Uri.parse("https://adminpanel.holzteller.com/public/api/mayhelp"),
        body: jsonEncode({
          "user_id": userId,
        }),
        headers: {
          "Content-Type": "application/json",
          "Access-Token": jwt,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return StageData.fromJson(jsonDecode(response.body));
      } else {
        Methods.showSnack("Alert", jsonDecode(response.body)["message"]);
        return null;
      }
    } catch (e) {
      debugPrint("=====>  Error quotationApi Api===> $e");
      Methods.showSnack("Alert", e.toString());
      return null;
    }
  }

  static Future<StageData?> reportAnswer({
    required String userId,
    required String jwt,
  }) async {
    try {
      final response = await _client.post(
        Uri.parse(
            "https://adminpanel.holzteller.com/public/api/reportconcernlist"),
        body: jsonEncode({
          "user_id": userId,
        }),
        headers: {
          "Content-Type": "application/json",
          "Access-Token": jwt,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return StageData.fromJson(jsonDecode(response.body));
      } else {
        Methods.showSnack("Alert", jsonDecode(response.body)["message"]);
        return null;
      }
    } catch (e) {
      debugPrint("=====>  Error quotationApi Api===> $e");
      Methods.showSnack("Alert", e.toString());
      return null;
    }
  }

  static Future uploadFileApiCall(
      File fileDoc, Map<String, dynamic> body, String jwt) async {
    String fileName1 = fileDoc.path.split('/').last;
    body.addEntries({
      MapEntry(
          "document_file",
          await part1.MultipartFile.fromFile(
            fileDoc.path,
            filename: fileName1,
          )),
    });

    part1.FormData data = part1.FormData.fromMap(body);
    part1.Dio dio = part1.Dio();
    dio
        .post("https://adminpanel.holzteller.com/public/api/addreportconcern",
            data: data,
            options: part1.Options(headers: {
              'Content-Type': 'application/json',
              'Access-Token': jwt,
            }))
        .then((response) {
      Map jsonResponse = jsonDecode(response.toString());
      print("====================${jsonResponse['status']}");
      if (jsonResponse['status'] == true) {
        Methods.showSnackDone("Alert", "Your Report Sent");
      }
    }).catchError((error) => print(error));
  }

  static Future<bool?> reportConcern({
    required String userId,
    required String jwt,
    required String subject,
    required String description,
    required String documentFile,
  }) async {
    try {
      final response = await _client.post(
        Uri.parse(
            "https://adminpanel.holzteller.com/public/api/addreportconcern"),
        body: jsonEncode({
          "user_id": userId,
          "subject": subject,
          "description": description,
        }),
        headers: {
          "Content-Type": "application/json",
          "Access-Token": jwt,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      } else {
        Methods.showSnack("Alert", jsonDecode(response.body)["message"]);
        return null;
      }
    } catch (e) {
      debugPrint("=====>  Error quotationApi Api===> $e");
      Methods.showSnack("Alert", e.toString());
      return null;
    }
  }

  static Future<Login?> addCancelApproveApi({
    required String userId,
    required int approveID,
    required int approveStatus,
    String? cancelReason,
    required String jwt,
  }) async {
    try {
      final response = await _client.post(
        Uri.parse(
            "https://adminpanel.holzteller.com/public/api/addcancelapprove"),
        body: jsonEncode({
          "user_id": userId,
          "approve_id": approveID,
          "approve_status": approveStatus,
          "cancel_reason": cancelReason,
        }),
        headers: {
          "Content-Type": "application/json",
          "Access-Token": jwt,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Login.fromJson(jsonDecode(response.body));
      } else {
        Methods.showSnack("Alert", jsonDecode(response.body)["message"]);

        return null;
      }
    } catch (e) {
      debugPrint("=====>  Error addCancelApproveApi Api===> $e");
      return null;
    }
  }
}
