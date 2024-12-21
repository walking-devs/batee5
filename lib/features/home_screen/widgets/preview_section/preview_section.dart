// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:batee5/features/home_screen/widgets/preview_section/components/underline_button.dart';
import 'package:batee5/a_core/constants/app_colors.dart';

class PreviewSection extends StatelessWidget {
  double spacing;
  final String title;
  final int fullItemCount;
  final List<Widget> items;
  final int crossAxisCount;
  final double mainAxisExtent;
  PreviewSection({
    Key? key,
    this.spacing = 20,
    required this.title,
    required this.fullItemCount,
    required this.items,
    required this.crossAxisCount,
    required this.mainAxisExtent,
  }) : super(key: key);

  double width = 0;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(width: 5),
                // fullItemCount > 8
                //     ? Text(
                //       // "${fullItemCount - 8}+",
                //       style: TextStyle(
                //         color: Colors.black,
                //         fontSize: width * 0.04 > 16 ? 16 : width * 0.04,
                //         fontWeight: FontWeight.w500,
                //         fontFamily: 'Poppins',
                //       ),
                //     )
                //     : const SizedBox(),
              ],
            ),
            UnderlineButton(
              width: width,
              title: "More",
              onTap: () {
                debugPrint('see all tapped');
              },
              color: AppColors.orange,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Wrap(spacing: spacing, children: items),
      ],
    );
  }
}
