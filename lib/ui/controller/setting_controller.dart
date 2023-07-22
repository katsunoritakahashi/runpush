import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:runpush/model/schedule_data.dart';
import '../../model/form_validation.dart';
import '../../util/form_validator.dart';
import 'base_view_controller.dart';

class SettingController extends BaseViewController {
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  final scheduleData = ScheduleData(startAt: ''.obs, endAt: ''.obs, interval: 0.obs);

  FormValidation validateTimeAfterStartTime({String? value, required String? startAt}) =>
      FormValidator.validateDateTimeAfterStartDateTime(endAt: value, startAt: startAt);

  bool get isCreateScheduleValid =>
      validateTimeAfterStartTime(value: scheduleData.endAt(), startAt: scheduleData.startAt())
          .isValid;

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
      await Future.wait([
        () async {
          // await api.registerDeviceToken(deviceToken: token);
        }(),
      ]);
    });
  }
}
