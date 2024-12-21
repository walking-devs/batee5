// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:batee5/a_core/constants/app_colors.dart';

class CustomAppBarLeading extends StatelessWidget {
  final String? leadingText;

  final String? midText;

  final String? description;
  final bool backButton;
  Color? midTextColor;

  CustomAppBarLeading({
    super.key,
    this.leadingText,
    this.midText,
    this.description,
    this.backButton = false,
    this.midTextColor,
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
                        color: AppColors.lightGreen,
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
                  color: AppColors.lightGreen,
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
                  color: midTextColor ?? Colors.white,
                  fontSize: 25,
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
