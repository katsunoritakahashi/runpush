import 'package:flutter/material.dart';
import 'package:runpush/ui/widget/primary_small_button.dart';
import 'package:runpush/ui/widget/primary_small_outline_button.dart';

class NormalDialog extends StatelessWidget {
  const NormalDialog({
    super.key,
    required this.message,
    required this.onPressed,
    this.text1 = 'はい！',
    this.text2 = 'いいえ',
  });

  final String message;
  final VoidCallback onPressed;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      title: Text(message,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center),
      children: [
        SimpleDialogOption(onPressed: onPressed, child: PrimarySmallButton(text: text1)),
        SimpleDialogOption(
          child: PrimarySmallOutlineButton(text: text2),
          onPressed: () {
            Navigator.pop(context, false);
          },
        )
      ],
    );
  }
}
