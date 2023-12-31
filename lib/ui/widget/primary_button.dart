import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/app_size.dart';
import '../common/app_color.dart';
import '../common/ui_helper.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    this.width = double.infinity,
    this.height = buttonHeight,
    this.isValid = true,
    this.onPressed,
    this.color = primaryColor,
  });

  final String label;
  final double width;
  final double height;
  final VoidCallback? onPressed;
  final bool isValid;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: const StadiumBorder(),
          elevation: 0,
        ),
        onPressed: isValid ? onPressed : null,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

class PrimaryOutlineButton extends StatelessWidget {
  const PrimaryOutlineButton({
    super.key,
    required this.label,
    this.width = double.infinity,
    this.height = buttonHeight,
    this.isValid = true,
    this.onPressed,
    this.color = primaryColor,
  });

  final String label;
  final double width;
  final double height;
  final VoidCallback? onPressed;
  final bool isValid;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: color,
          shape: const StadiumBorder(),
          side: BorderSide(color: color),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

class PrimaryOutlineIconButton extends StatelessWidget {
  const PrimaryOutlineIconButton({
    super.key,
    required this.label,
    this.width = double.infinity,
    this.height = 56,
    this.isValid = true,
    this.onPressed,
    this.color = primaryColor,
    required this.icon,
  });

  final String label;
  final double width;
  final double height;
  final VoidCallback? onPressed;
  final bool isValid;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: color,
          shape: const StadiumBorder(),
          side: BorderSide(color: color),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            horizontalSpaceSmall,
            Text(label,
                textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.w700)),
          ],
        ),
      ),
    );
  }
}

class SmallPrimaryButton extends StatelessWidget {
  const SmallPrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isValid = true,
  });

  final String label;

  final VoidCallback? onPressed;

  final bool isValid;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Get.theme.primaryColor,
          foregroundColor: Colors.white,
          shape: const StadiumBorder(),
          elevation: 0,
        ),
        onPressed: isValid ? onPressed : null,
        child: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
