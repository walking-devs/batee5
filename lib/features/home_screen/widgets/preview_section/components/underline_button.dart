import 'package:flutter/material.dart';

class UnderlineButton extends StatelessWidget {
  final String title;
  final double width;
  final Function onTap;
  final Color color;
  const UnderlineButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.color,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              decorationColor: color,
              decoration: TextDecoration.underline,
              color: color,
              fontSize: width * 0.04 > 16 ? 16 : width * 0.04,
              fontWeight: FontWeight.bold,
              fontFamily: "Poppins",
            ),
          ),
        ],
      ),
    );
  }
}
