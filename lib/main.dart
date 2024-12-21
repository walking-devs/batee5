import 'package:batee5/features/home_screen/home_screen.dart';
import 'package:batee5/a_core/config/app_router.dart';
import 'package:batee5/a_core/config/apptheme.dart';
import 'package:batee5/a_core/widgets/bottom_nav_bar.dart';
import 'package:batee5/a_core/widgets/batee5_app_bar/batee5_app_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  double height = 0;
  double width = 0;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    final AppRouter appRouter = AppRouter();

    return MaterialApp(
      onGenerateRoute: appRouter.onGenerateRoute,
      theme: AppTheme.lightTheme,
    );
  }
}
