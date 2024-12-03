// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:batee5/a_core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class BannerScroller extends StatefulWidget {
  List<Widget> banners;
  BannerScroller({super.key, required this.banners});

  @override
  State<BannerScroller> createState() => _BannerScrollerState();
}

class _BannerScrollerState extends State<BannerScroller> {
  double height = 0;

  double width = 0;

  int index = 0;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        CarouselSlider(
          disableGesture: true,
          items: widget.banners,
          options: CarouselOptions(
            height: width * 0.44,
            onPageChanged: (index, reason) {
              setState(() {
                this.index = index;
              });
            },
            enableInfiniteScroll: false,
            viewportFraction: 1,
            enlargeStrategy: CenterPageEnlargeStrategy.scale,
            // aspectRatio: .2,
            scrollDirection: Axis.horizontal,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              widget.banners
                  .map(
                    (e) => Container(
                      padding: const EdgeInsets.all(3.0),
                      child: Icon(
                        Icons.circle,
                        color:
                            index == widget.banners.indexOf(e)
                                ? AppColors.blue
                                : AppColors.midGrey,
                        size: width * 0.03,
                      ),
                    ),
                  )
                  .toList(),
        ),
      ],
    );
  }
}
