import 'package:batee5/a_core/constants/app_colors.dart';
import 'package:batee5/a_core/constants/app_fonts.dart';
import 'package:batee5/a_core/widgets/batee5_app_bar/components/multi_color_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Batee5AppBar extends StatelessWidget implements PreferredSizeWidget {
  final double barHeight;
  final List<Widget>? actions;
  final Widget? title;
  final double toolbarHeight;
  const Batee5AppBar({
    super.key,
    required this.barHeight,
    this.actions,
    this.title,
    required this.toolbarHeight,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: toolbarHeight,
      title: title,
      actions: [...actions ?? []],
      backgroundColor: AppColors.navyBlue,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(barHeight);
}
