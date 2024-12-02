import 'package:batee5/a_core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final double position;
  final int length;
  final int index;
  final ValueChanged<int> onTap;
  final Widget child;
  final bool animate;
  final String title;
  const NavButton({
    super.key,
    required this.onTap,
    required this.position,
    required this.length,
    required this.index,
    required this.child,
    required this.animate,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final desiredPosition = 1.0 / length * index;
    final difference = (position - desiredPosition).abs();
    final verticalAlignment = 1 - length * difference;
    final opacity = length * difference;
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          onTap(index);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 30,
              child: Transform.translate(
                offset: Offset(
                  0,
                  difference < 1.0 / length ? verticalAlignment * 40 : 0,
                ),
                child: Opacity(
                  opacity: difference < 1.0 / length * 0.99 ? opacity : 1.0,
                  child: child,
                ),
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: width * .032,
                //TODO: add bloc listener
                color: true || index == 2 ? AppColors.blue : AppColors.darkGrey,
                fontFamily: "Poppins",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
