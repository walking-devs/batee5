// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:batee5/a_core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIconButton extends StatelessWidget {
  String iconPath;
  Function() onPressed;
  SvgIconButton({super.key, required this.iconPath, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        width: .26 * width > 200 ? 200 : .26 * width,
        height: .128 * width > 96 ? 96 : .128 * width,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.lightGrey,
            width: width * .005 > 1 ? 1 : width * .005,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            width * .04 > 10 ? 10 : width * .04,
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            iconPath,
            width: .06 * width > 40 ? 40 : .06 * width,
            height: .06 * width > 40 ? 40 : .06 * width,
          ),
        ),
      ),
    );
  }
}
