import 'package:batee5/a_core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationPicker extends StatelessWidget {
  LocationPicker({super.key});

  double width = 0;
  @override
  Widget build(BuildContext context) {
    width =
        MediaQuery.of(context).size.width > 300
            ? 300
            : MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () async {
        _requestLocationPermission();
        debugPrint('location pressed');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/icons/current_location.svg',
              width: width * .05,
            ),
            const SizedBox(width: 10),
            Text(
              'Select location ',
              style: TextStyle(
                color: AppColors.navyBlue,
                fontSize: width * .037,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _requestLocationPermission() async {
  final status = await Permission.location.request();

  if (status == PermissionStatus.granted) {
    print("Permission granted.");
  } else if (status == PermissionStatus.denied) {
    print("Permission denied.");
  } else if (status == PermissionStatus.permanentlyDenied) {
    print("Permission permanently denied. Open app settings.");
    await openAppSettings(); // Only for permanently denied permissions
  }
}
