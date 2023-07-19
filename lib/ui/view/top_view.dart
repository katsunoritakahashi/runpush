import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common/app_color.dart';

final List<String> imgList = [
  'assets/images/introduction_1.png',
  'assets/images/introduction_2.png',
  'assets/images/introduction_3.png',
  'assets/images/introduction_4.png',
];

class TopView extends StatefulWidget {
  const TopView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<TopView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              child: const Text('ログイン',
                  style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 14)),
              onTap: () => Get.to(() {}),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [],
          ),
        ),
      ),
    );
  }
}
