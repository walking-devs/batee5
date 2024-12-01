import 'package:batee5/a_core/constants/app_colors.dart';
import 'package:batee5/a_core/widgets/custom_curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  double width = 0;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return CurvedNavigationBar(
      itemsNames: const ['Home', 'Chat', 'Sell', 'Ads', 'Profile'],
      height: 60,
      color: AppColors.navyBlue,
      animate: false,
      backgroundColor: Colors.transparent,
      // color: Colors.transparent,
      letIndexChange: (index) => false,
      index: 2,
      items: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                'assets/icons/home_${true ? "enabled" : "disbaled"}.svg',
                // semanticsLabel: 'Acme Logo',
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {},
          child: SvgPicture.asset(
            'assets/icons/chat_${false ? "enabled" : "disabled"}.svg',
            // semanticsLabel: 'Acme Logo',
          ),
        ),
        CircleAvatar(
          radius: 40,
          backgroundColor: AppColors.blue,
          child: Icon(size: width * .068, Icons.add, color: Colors.white),
        ),
        GestureDetector(
          onTap: () {},
          child: SvgPicture.asset(
            'assets/icons/ads_${false ? "enabled" : "disabled"}.svg',
            // semanticsLabel: 'Acme Logo',
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: SvgPicture.asset(
            'assets/icons/profile_${false ? "enabled" : "disabled"}.svg',
            // semanticsLabel: 'Acme Logo',
          ),
        ),
      ],
    );
  }
}
