import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runpush/service/api_service.dart';
import 'package:runpush/ui/widget/primary_button.dart';

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
    return MaterialApp(
      title: 'RUNPUSH',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RUNPUSH'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryButton(label: '設定する', onPressed: () => (){},)
          ],
        ),
      ),
    );
  }
}
