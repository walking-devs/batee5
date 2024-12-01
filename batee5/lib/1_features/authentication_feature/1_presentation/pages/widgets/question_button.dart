import 'package:batee5/a_core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class QuestionButton extends StatelessWidget {
  final String questionText;
  final String buttonText;
  final VoidCallback onPressed;
  const QuestionButton({
    super.key,
    required this.questionText,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          questionText,
          style: TextStyle(
            color: AppColors.darkGrey,
            fontSize: .037 * width > 14 ? 14 : .037 * width,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(width: 6),
        GestureDetector(
          onTap: () {
            onPressed();
          },
          child: Text(
            buttonText,
            style: TextStyle(
              color: AppColors.navyBlue,
              fontSize: .037 * width > 14 ? 14 : .037 * width,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
