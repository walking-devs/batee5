import 'package:batee5/a_core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class OutlinedMultiColorButton extends StatelessWidget {
  final Widget filledIcon;
  final Widget borderIcon;

  final Color fillColor;
  final Function onPressed;

  const OutlinedMultiColorButton({
    super.key,
    required this.filledIcon,
    required this.borderIcon,
    required this.fillColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: Stack(
          alignment: Alignment.center,
          children: [filledIcon, borderIcon],
        ),
      ),
    );
  }
}
