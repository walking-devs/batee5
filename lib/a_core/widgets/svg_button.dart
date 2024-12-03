import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgButton extends StatelessWidget {
  final String? svgPath;
  final VoidCallback? onPressed;
  SvgButton({super.key, required this.svgPath, this.onPressed});

  double height = 0;
  double width = 0;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: height * .052,
      child: Badge(
        //TODO: Change this to a bloc listener
        isLabelVisible: false,
        child: GestureDetector(
            onTap: () {
              if (onPressed != null) {
                onPressed!();
              }
            },
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: SvgPicture.asset(
                height: height * .025 > 30 ? 30 : height * .025,
                svgPath!,
              ),
            )),
      ),
    );
  }
}
