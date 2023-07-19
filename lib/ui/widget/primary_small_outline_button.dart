import 'package:flutter/material.dart';
import '../common/app_color.dart';
import '../common/ui_helper.dart';

class PrimarySmallOutlineButton extends StatelessWidget {
  const PrimarySmallOutlineButton({
    super.key,
    required this.text,
    this.color = primaryColor,
    this.icon,
  });

  final String text;
  final Color color;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: color),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null ? Icon(icon, color: color) : const SizedBox(),
            icon != null ? horizontalSpaceSmall : const SizedBox(),
            Text(
              text,
              style: TextStyle(color: color, fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}
