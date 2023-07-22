import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runpush/ui/widget/date_time_picker_form.dart';
import '../common/app_color.dart';
import '../common/ui_helper.dart';
import '../controller/setting_controller.dart';
import '../widget/loading_stack.dart';
import '../widget/primary_button.dart';
import 'package:intl/intl.dart';

class ScheduleView extends StatelessWidget {
  ScheduleView({super.key});

  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingController());
    final scheduleInfo = controller.scheduleData;
    DateFormat outputFormat = DateFormat('yyyy-MM-dd HH:mm:ss');

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
                      '応援して欲しい期間を\n設定してねっ！😋',
                      style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    verticalSpaceLarge,
                    DateTimePickerForm(
                        labelText: 'いつから',
                        onChange: (value) {
                          scheduleInfo.startAt.value = outputFormat.format(value!);
                        },
                        initialDateTime: DateTime.now(),
                        showInitialDate: true),
                    verticalSpaceMedium,
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
                      style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 16),
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
                isValid: controller.isCreateScheduleValid,
                onPressed: () {
                  controller.onTapOk();
                })),
          ),
        ),
      ),
    );
  }
}
