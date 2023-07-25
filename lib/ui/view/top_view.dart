import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runpush/ui/controller/setting_controller.dart';
import 'package:runpush/ui/view/schedule_view.dart';
import 'package:runpush/ui/widget/loading_stack.dart';
import '../common/app_color.dart';
import '../common/ui_helper.dart';

class TopView extends StatelessWidget {
  const TopView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.replace(SettingController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: const Text('RUNPUSH'),
      ),
      body: GetLoadingStack<SettingController>(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() {
              final controller = Get.put(SettingController());
              final user = controller.user();
              return Column(
                children: [
                  const Text(
                    'PUSH(応援)して欲しい\nキャラクターを選んでねっ！😋',
                    style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    '選んだキャラクターから応援メッセージが届くよ！',
                    style: TextStyle(color: gray3, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                  verticalSpaceSmall,
                  _CharacterCard(
                    imageUrl: 'assets/images/runtekun.png',
                    name: 'カエルとキツネのキメラ',
                    characterId: 1,
                    isSelected: user != null && user.characterId == 1,
                  ),
                  verticalSpaceSmall,
                  _CharacterCard(
                    imageUrl: 'assets/images/hisaju_san.png',
                    name: '校長',
                    characterId: 2,
                    isSelected: user != null && user.characterId == 2,
                  ),
                  verticalSpaceSmall,
                  _CharacterCard(
                    imageUrl: 'assets/images/pharaoh.png',
                    name: '𓉔𓍢𓃭𓄿𓂋𓄿𓍯',
                    characterId: 3,
                    isSelected: user != null && user.characterId == 3,
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}

class _CharacterCard extends StatelessWidget {
  const _CharacterCard({
    required this.imageUrl,
    required this.name,
    required this.characterId,
    required this.isSelected,
  });

  final String imageUrl;
  final String name;
  final int characterId;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => UserView(characterId: characterId)),
      child: Container(
        width: double.infinity,
        height: 170,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: isSelected ? Border.all(color: primaryColor, width: 2) : null,
          image: DecorationImage(
            image: AssetImage(imageUrl),
            fit: BoxFit.cover,
            colorFilter: const ColorFilter.mode(Colors.black26, BlendMode.srcATop), //
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white, fontSize: 22)),
            isSelected
                ? const _ColorTextLabel(labelText: '選択中', labelColor: primaryColor)
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}

class _ColorTextLabel extends StatelessWidget {
  const _ColorTextLabel({required this.labelText, required this.labelColor});

  final String labelText;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: labelColor,
        borderRadius: BorderRadius.circular(3),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      child: Text(
        labelText,
        style: Theme.of(context).textTheme.overline?.copyWith(color: Colors.white),
      ),
    );
  }
}
