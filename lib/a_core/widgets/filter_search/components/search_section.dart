// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SearchSection extends StatelessWidget {
  final String title;
  final List<String> items;
  final Widget? leading;
  final Widget? trailing;

  Function(int index)? onItmePressed;
  Function(int index)? trailingFunction;
  SearchSection({
    super.key,
    required this.title,
    required this.items,
    this.leading,
    this.trailing,
    required this.onItmePressed,
    this.trailingFunction,
  });
  double width = 0;
  @override
  Widget build(BuildContext context) {
    width =
        MediaQuery.of(context).size.width > 300
            ? 300
            : MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontSize: width * .0426,
              fontWeight: FontWeight.w600,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  if (onItmePressed != null) {
                    onItmePressed!(index);
                  }
                },
                child: Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          leading == null
                              ? Container()
                              : Row(
                                children: [
                                  leading!,
                                  SizedBox(width: width * .02),
                                ],
                              ),
                          Text(
                            items[index],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width * .037,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      trailing ?? Container(),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
