import 'dart:math';

import 'package:batee5/a_core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDropDownMenu extends StatefulWidget {
  final double width;
  final double height;
  final List<String> items;
  final String innitialValue;
  final Function(String) onSelected;
  bool enabled;
  CustomDropDownMenu({
    super.key,
    this.enabled = false,
    required this.width,
    required this.height,
    required this.items,
    required this.innitialValue,
    required this.onSelected,
  });

  @override
  State<CustomDropDownMenu> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  String selectedValue = "";
  @override
  void initState() {
    selectedValue = widget.innitialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              widget.enabled = !widget.enabled;
            });
          },
          child: Container(
            width: widget.width,
            height: widget.height,
            color: AppColors.lightGrey,
            child: Center(
              child: Text(
                selectedValue,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        if (widget.enabled)
          SizedBox(
            height: 190,
            child: SingleChildScrollView(
              child: Column(
                children:
                    widget.items
                        .map(
                          (e) => GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.onSelected(e);
                                selectedValue = e;
                                widget.enabled = false;
                              });
                            },
                            child: Container(
                              width: widget.width,
                              height: widget.height,
                              color: AppColors.lightGrey,
                              child: Center(
                                child: Text(
                                  e,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
              ),
            ),
          ),
      ],
    );
  }
}
