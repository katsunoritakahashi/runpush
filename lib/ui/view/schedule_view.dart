import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runpush/ui/widget/date_time_picker_form.dart';
import '../common/app_color.dart';
import '../common/ui_helper.dart';
import '../controller/setting_controller.dart';
import '../widget/loading_stack.dart';
import '../widget/primary_button.dart';
import 'package:intl/intl.dart';

class UserView extends StatelessWidget {
  UserView({super.key, required this.characterId});

  final focusNode = FocusNode();
  final int characterId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingController());
    final scheduleInfo = controller.userData;
    DateFormat outputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
    scheduleInfo.endAt.value = outputFormat.format(DateTime.now().add(const Duration(days: 2)));
    scheduleInfo.characterId.value = characterId;

    return Focus(
      focusNode: focusNode,
      child: GestureDetector(
        onTap: focusNode.requestFocus,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: primaryColor,
            centerTitle: true,
            title: const Text('スケジュール設定'),
          ),
          body: GetLoadingStack<SettingController>(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Container(
                padding: const EdgeInsets.only(right: 16, left: 16, top: 40, bottom: 24),
                child: Column(
                  children: [
                    const Text(
                      'いつまで応援して欲しいか\n設定してねっ！😋',
                      style:
                          TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    verticalSpaceLarge,
                    DateTimePickerForm(
                        labelText: 'いつまで',
                        onChange: (value) {
                          scheduleInfo.endAt.value = outputFormat.format(value!);
                        },
                        initialDateTime: DateTime.now().add(const Duration(days: 2)),
                        showInitialDate: true),
                    verticalSpaceMediumLarge,
                    const Text(
                      '応援メッセージは数時間おきに届くよっ！😋',
                      style:
                          TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.all(24),
            child: Obx(() => PrimaryButton(
                label: 'けってい！',
                isValid: controller.isCreateUserValid,
                onPressed: () => controller.onTapOk())),
          ),
        ),
      ),
    );
  }
}
