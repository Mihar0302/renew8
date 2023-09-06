import 'package:ReNew8/utils/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controller/global_controller.dart';
import 'helper/shared_pref_helper.dart';
import 'notification_data/push_notif_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.subscribeToTopic('all');
  final GlobalController globalCacheController = Get.put(GlobalController());
  await PushNotificationService.initialise(globalCacheController);
  final SharedPreferencesHelper sharedHelp = SharedPreferencesHelper(
    pref: await SharedPreferences.getInstance(),
  );
  globalCacheController.userToken.value = sharedHelp.getUserToken;
  globalCacheController.userId.value = sharedHelp.getUserId;
  globalCacheController.userFistNAme.value = sharedHelp.getUserName;

  debugPrint(
      "===> login token get ======> ${globalCacheController.userToken.value}");
  debugPrint("===> login ID get ======> ${globalCacheController.userId.value}");
  debugPrint("===> login userName ======> ${globalCacheController.userFistNAme.value}");
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  await FlutterDownloader.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      supportedLocales: const [
        Locale('en', 'US'), // English
        Locale('hi', 'hi'), // Thai
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins",
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple,
        ).copyWith(background: Colors.white),
      ),
      initialRoute: '/',
      onGenerateRoute: AppRouter.generateRoute,
      builder: (context, child) {
        return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!);
      },
    );
  }
}
