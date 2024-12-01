// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:batee5/1_features/home_screen/home_screen.dart';
import 'package:batee5/a_core/widgets/bottom_nav_bar.dart';

class Wrapper extends StatelessWidget {
  final List<Widget> pages;
  final int currentIndex;
  const Wrapper({super.key, required this.pages, this.currentIndex = 0});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          pages[currentIndex],
          Align(alignment: Alignment.bottomCenter, child: BottomNavBar()),
        ],
      ),
    );
  }
}
