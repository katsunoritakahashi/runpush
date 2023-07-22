import 'package:firebase_messaging/firebase_messaging.dart';
import 'base_view_controller.dart';

class SettingController extends BaseViewController {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  @override
  void onInit() {
    super.onInit();
    fetchData(useLoadingState: true);
  }

  Future<void> fetchData({bool useLoadingState = false}) async {
    await callAsyncApi(useLoadingState: useLoadingState, () async {
        String? token = await _fcm.getToken();
        print(token);
        await Future.wait([
          () async {
              // await api.registerDeviceToken(deviceToken: token);
          }(),
        ]);
    });
  }
}
