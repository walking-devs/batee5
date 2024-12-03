import 'package:batee5/a_core/constants/app_colors.dart';
import 'package:batee5/a_core/utils/datetime_utils.dart';
import 'package:batee5/a_core/widgets/batee5_app_bar/components/multi_color_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductCard extends StatefulWidget {
  final String imageUrl;
  final double size;
  final String title;
  final String description;
  final double price;
  final String location;
  final DateTime dateListed;
  final int? numberOfBedrooms;
  final int? numberOfBathrooms;
  final int? area;
  bool isFavorite;
  final VoidCallback? onPressed;
  ProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
    required this.location,
    required this.dateListed,
    this.numberOfBedrooms,
    this.numberOfBathrooms,
    this.area,
    required this.isFavorite,
    required this.onPressed,
    required this.size,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  double width = 0;
  double height = 0;
  @override
  Widget build(BuildContext context) {
    width = widget.size;
    return GestureDetector(
      onTap: () {
        if (widget.onPressed != null) {
          widget.onPressed!();
        }
      },
      child: Container(
        width: width * .3,
        height: width * .47,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          border: Border.all(
            width: width * .00266,
            color: AppColors.borderGrey,
          ),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: width * .19,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: widget.imageUrl.startsWith("http")
                          ? NetworkImage(widget.imageUrl) as ImageProvider
                          : AssetImage(widget.imageUrl) as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Text(
                  "EGP ${widget.price}",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: width * .04,
                    color: AppColors.darkBlue,
                  ),
                ),
                Text(
                  widget.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: width * .037,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: width * .05,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(width: width * .005),
                      widget.numberOfBedrooms != null
                          ? SvgPicture.asset(
                            width: width * .05,
                            'assets/icons/bedroom.svg',
                          )
                          : const SizedBox(),
                      SizedBox(width: width * .015),
                      widget.numberOfBathrooms != null
                          ? SvgPicture.asset(
                            width: width * .05,
                            'assets/icons/bathroom.svg',
                          )
                          : const SizedBox(),
                      SizedBox(width: width * .015),
                      widget.numberOfBedrooms != null
                          ? Row(
                            children: [
                              SvgPicture.asset(
                                width: width * .05,
                                'assets/icons/area.svg',
                              ),
                              SizedBox(width: width * .01),
                              Text(
                                "${widget.area} m²",
                                style: TextStyle(
                                  color: AppColors.darkGrey2,
                                  fontSize: width * .032,
                                ),
                              ),
                            ],
                          )
                          : const SizedBox(),
                    ],
                  ),
                ),
                Text(
                  widget.location,
                  style: TextStyle(
                    fontSize: width * .037,
                    fontWeight: FontWeight.w400,
                    color: AppColors.darkGrey,
                  ),
                ),
                Text(
                  DateTimeUtils.getFormattedDuration(
                    DateTime.now().difference(widget.dateListed),
                  ),
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: width * .037,
                    color: AppColors.darkGrey,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment(.9, -1.08),
              child: SizedBox(
                width: width * .04,
                child: OutlinedMultiColorButton(
                  fillColor: Colors.white,
                  filledIcon:
                      widget.isFavorite
                          ? const SizedBox()
                          : Icon(
                            size: width * .022,
                            Icons.favorite_rounded,
                            color: Colors.red,
                          ),
                  borderIcon: Icon(
                    size: width * .022,
                    Icons.favorite_outline_rounded,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      widget.isFavorite = !widget.isFavorite;
                    });
                    debugPrint("Favorite");
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
