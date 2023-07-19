import 'package:firebase_core/firebase_core.dart';

class AppConfig {
  AppConfig({
    required this.androidPackageName,
    required this.iOSBundleId,
    required this.firebaseOptions,
  });

  final String androidPackageName;
  final String iOSBundleId;
  final FirebaseOptions firebaseOptions;
}
