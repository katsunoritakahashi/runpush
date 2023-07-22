import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common/app_color.dart';
import '../common/ui_helper.dart';
import '../controller/setting_controller.dart';
import '../widget/cajico_text_form_field.dart';
import '../widget/loading_stack.dart';
import '../widget/primary_button.dart';

class ScheduleView extends StatelessWidget {
  ScheduleView({super.key});

  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingController());
    final scheduleInfo = controller.scheduleData;

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
                      '応援して欲しいスケジュールを\n設定してねっ！😋',
                      style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    verticalSpaceLarge,
                    CajicoTextFormField(
                      label: 'いつから',
                      initValue: '',
                      maxLines: 1,
                      onChanged: (value) => () {},
                      validator: (value) => controller.validateInputEmailData(value).message,
                    ),
                    verticalSpaceMedium,
                    CajicoTextFormField(
                      label: 'いつまで',
                      initValue: '',
                      obscureText: true,
                      maxLines: 1,
                      onChanged: (value) => () {},
                      validator: (value) =>
                      controller.validateInputEditData(value: value, maxLength: 20).message,
                    ),
                    verticalSpaceMediumLarge,
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.all(24),
            child: Obx(() => PrimaryButton(
                label: 'けってい！',
                isValid: controller.isScheduleButtonValid,
                onPressed: () {
                  controller.onTapOk();
                })),
          ),
        ),
      ),
    );
  }
}
