import 'package:flutter/material.dart';
import 'package:runpush/ui/widget/primary_small_button.dart';

class NormalCompletedDialog extends StatelessWidget {
  const NormalCompletedDialog({
    super.key,
    required this.message,
    required this.onPressed,
  });

  final String message;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      title: Text(message,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center),
      children: [
        SimpleDialogOption(
          onPressed: onPressed,
          child: const PrimarySmallButton(text: 'OK'),
        )
      ],
    );
  }
}
