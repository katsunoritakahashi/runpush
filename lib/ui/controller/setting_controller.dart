import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:runpush/model/schedule_data.dart';
import '../../model/form_validation.dart';
import '../../util/form_validator.dart';
import 'base_view_controller.dart';

class SettingController extends BaseViewController {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  DateFormat outputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');

  final scheduleData = ScheduleData(endAt: ''.obs, characterId: 0.obs);

  FormValidation validateTimeAfterNow({String? value}) =>
      FormValidator.validateDateTimeAfterNow(endAt: value);

  bool get isCreateScheduleValid => validateTimeAfterNow(value: scheduleData.endAt()).isValid;

  Future<void> onTapOk() async {}

  @override
  void onInit() {
    super.onInit();
    fetchData(useLoadingState: true);
  }

  Future<void> fetchData({bool useLoadingState = false}) async {
    await callAsyncApi(useLoadingState: useLoadingState, () async {
      String? token = await _fcm.getToken();
      print(token);
      UserCredential userCredential = await _auth.signInAnonymously();
      print("匿名ユーザーのUID: ${userCredential.user?.uid}");
      await Future.wait([
        () async {
          // await api.registerDeviceToken(deviceToken: token);
        }(),
      ]);
    });
  }
}
