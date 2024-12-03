import 'package:batee5/a_core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBarLeading extends StatelessWidget {
  final String? leadingText;

  final String? midText;

  final String? description;
  final bool backButton;

  const CustomAppBarLeading({
    super.key,
    this.leadingText,
    this.midText,
    this.description,
    this.backButton = false,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        backButton == true
            ? GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Row(
                children: [
                  Icon(
                    size: height * .023,
                    Icons.arrow_back_ios,
                    color: AppColors.blue,
                  ),
                  Text(
                    'Back',
                    style: TextStyle(
                      color: AppColors.blue,
                      fontSize: height * .021,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )
            : const SizedBox(),
        leadingText == null
            ? const SizedBox()
            : Text(
              leadingText!,
              style: TextStyle(
                color: AppColors.blue,
                fontSize: height * .042,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w700,
              ),
            ),
        SizedBox(height: height * .02),
        midText == null
            ? const SizedBox()
            : Text(
              midText!,
              style: TextStyle(
                color: Colors.white,
                fontSize: height * .042,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w700,
              ),
            ),
        SizedBox(height: height * .015),
        description == null
            ? const SizedBox()
            : SizedBox(
              width: width * .72,
              child: Text(
                maxLines: 2,
                description!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: height * .015,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
      ],
    );
  }
}
