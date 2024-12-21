import 'package:batee5/a_core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LocationSelector extends StatelessWidget {
  final VoidCallback? onPressed;
  LocationSelector({super.key, required this.onPressed});

  double height = 0;
  double width = 0;
  @override
  Widget build(BuildContext context) {
    width =
        MediaQuery.of(context).size.width / 2 > 500
            ? 500
            : MediaQuery.of(context).size.width / 2;
    // height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        if (onPressed != null) {
          onPressed!();
        }
        //TODO: implement the location selection
      },
      child: SizedBox(
        width: width * 0.239,
        child: Row(
          children: [
            SvgPicture.asset(width: width * 0.026, 'assets/icons/location.svg'),
            SizedBox(width: width * 0.01),
            Text(
              //TODO: replace with the selected location
              'Egypt',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Poppins',
                fontSize: width * 0.04,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: width * 0.01),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: width * 0.04,
              color: AppColors.darkGrey,
            ),
          ],
        ),
      ),
    );
  }
}
