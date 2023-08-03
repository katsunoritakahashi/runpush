import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runpush/service/api_service.dart';
import 'package:runpush/service/push_notification_service.dart';
import 'package:runpush/ui/view/top_view.dart';

import 'firebase_options.dart';
import 'model/app_config.dart';

void main() => run(
  AppConfig(
    androidPackageName: 'com.example.runpush',
    iOSBundleId: 'com.example.runpush',
    firebaseOptions: DefaultFirebaseOptions.currentPlatform,
  ),
);

Future<void> run(AppConfig config) async {
  Get.lazyPut(ApiService.new);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: config.firebaseOptions);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    PushNotificationService().initialize();
    return GetMaterialApp(
      title: 'RUNPUSH',
      theme: ThemeData(),
      home: const TopView(),
    );
  }
}
