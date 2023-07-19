import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../constant/app_strings.dart';
import '../../model/loading_state.dart';
import '../../service/api_service.dart';
import '../widget/common_dialog.dart';

class BaseViewController extends GetxController {
  final api = Get.find<ApiService>();
  final RxInt tabIndex = 0.obs;
  Rx<LoadingState> loadingState = Rx<LoadingState>(LoadingSuccess());

  Future<void> callAsyncApi(
    AsyncCallback callback, {
    Function(Exception)? onException,
    bool useLoadingState = true,
  }) async {
    if (useLoadingState) {
      loadingState.value = LoadingInProgress();
    }
    try {
      await callback();
      if (useLoadingState) {
        loadingState.value = LoadingSuccess();
      }
    } on Exception catch (e) {
      Get.log(e.toString());
      if (useLoadingState) {
        loadingState.value = LoadingFailure();
      }
      if (onException == null) {
        unawaited(Get.dialog(
          DefaultAlertDialog(
            description: e is ApiException ? e.message : Strings.apiError,
          ),
        ));
      } else {
        onException(e);
      }
    }
  }
}
