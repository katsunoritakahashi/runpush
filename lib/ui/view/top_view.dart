import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:runpush/ui/controller/setting_controller.dart';
import 'package:runpush/ui/view/schedule_view.dart';
import '../common/app_color.dart';
import '../common/ui_helper.dart';

class TopView extends StatelessWidget {
  const TopView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title: const Text('RUNPUSH'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            Text(
              'PUSH(応援)して欲しい\nキャラクターを選んでねっ！😋',
              style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            Text(
              '選んだキャラクターから応援メッセージが届くよ！',
              style: TextStyle(color: gray3, fontSize: 14),
              textAlign: TextAlign.center,
            ),
            verticalSpaceSmall,
            _CharacterCard(
                imageUrl: 'assets/images/runtekun.png', name: 'カエルとキツネのキメラ', characterId: 1),
            verticalSpaceSmall,
            _CharacterCard(imageUrl: 'assets/images/hisaju_san.png', name: '校長', characterId: 2),
            verticalSpaceSmall,
            _CharacterCard(
                imageUrl: 'assets/images/pharaoh.png', name: '𓉔𓍢𓃭𓄿𓂋𓄿𓍯', characterId: 3),
          ],
        ),
      ),
    );
  }
}

class _CharacterCard extends StatelessWidget {
  const _CharacterCard({required this.imageUrl, required this.name, required this.characterId});

  final String imageUrl;
  final String name;
  final int characterId;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => ScheduleView(characterId: characterId)),
      child: Container(
        width: double.infinity,
        height: 170,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(imageUrl),
            fit: BoxFit.cover,
            colorFilter: const ColorFilter.mode(Colors.black26, BlendMode.srcATop), //
          ),
        ),
        child: Text(name,
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 22)),
      ),
    );
  }
}
