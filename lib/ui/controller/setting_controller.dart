import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:runpush/model/user.dart';
import '../../model/form_validation.dart';
import '../../util/form_validator.dart';
import 'base_view_controller.dart';

class SettingController extends BaseViewController {
  final user = Rxn<User>();
  final FirebaseMessaging _fcm = FirebaseMessaging.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  DateFormat outputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');

  final userData = UserData(endAt: ''.obs, characterId: 0.obs, uid: ''.obs, deviceToken: ''.obs);

  FormValidation validateTimeAfterNow({String? value}) =>
      FormValidator.validateDateTimeAfterNow(endAt: value);

  bool get isCreateUserValid => validateTimeAfterNow(value: userData.endAt()).isValid;

  Future<void> onTapOk() async {}

  @override
  void onInit() {
    super.onInit();
    fetchData(useLoadingState: true);
  }

  Future<void> fetchData({bool useLoadingState = false}) async {
    await callAsyncApi(useLoadingState: useLoadingState, () async {
      String? token = await _fcm.getToken();
      UserCredential userCredential = await _auth.signInAnonymously();
      userData.uid.value = userCredential.user!.uid;
      userData.deviceToken.value = token!;
      await Future.wait([
        () async {
          bool result = await api.judgeUser(uid: userData.uid());
          if (result) {
            user.value = await api.getUser(uid: userData.uid());
            userData.characterId.value = user()!.characterId;
          }
        }(),
      ]);
    });
  }
}
