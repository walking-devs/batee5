// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:batee5/a_core/constants/app_colors.dart';

class Batee5SearchBar extends StatelessWidget {
  final String hintText;
  Function(String)? onChanged;
  Function(String)? onSubmitted;
  TextEditingController? controller;
  bool enabled;
  Function()? onTap;
  Batee5SearchBar({
    super.key,
    required this.hintText,
    this.onChanged,
    this.onSubmitted,
    this.controller,
    this.enabled = true,
    this.onTap,
  });
  double height = 0;
  double width = 0;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      width: 600,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        enabled: enabled,
        onTap: () {
          if (onTap!() != null) {
            onTap!();
          }
        },
        controller: controller,
        onChanged: (value) {
          if (onChanged != null) {
            onChanged!(value);
          }
        },
        onSubmitted: (value) {
          if (onSubmitted != null) {
            onSubmitted!(value);
          }
        },
        decoration: InputDecoration(
          hintText: hintText,

          hintStyle: TextStyle(
            height: 1.7,
            fontWeight: FontWeight.w400,
            fontSize: 20,
            color: AppColors.darkGrey,
          ),
          // hintText: hintText,
          icon: SvgPicture.asset('assets/icons/search.svg'),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
