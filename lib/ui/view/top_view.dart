import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runpush/ui/controller/setting_controller.dart';
import '../common/app_color.dart';
import '../widget/primary_button.dart';

class TopView extends StatelessWidget {
  const TopView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
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
