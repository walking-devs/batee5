import 'package:batee5/a_core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SubmitTextButton extends StatelessWidget {
  final Color color;
  final String text;
  final Function()? onPressed;
  bool? isEnabled;

  SubmitTextButton({
    super.key,
    this.color = const Color(0xFF03346E),
    required this.text,
    this.isEnabled = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPressed != null && isEnabled!) {
          onPressed!();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: isEnabled! ? color : AppColors.midGrey,
        ),
        height: 48,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
