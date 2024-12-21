// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:batee5/a_core/constants/app_colors.dart';

class CheckButton extends StatefulWidget {
  bool? checked;
  Function(bool)? onChanged;
  CheckButton({Key? key, this.checked = false, this.onChanged})
    : super(key: key);

  @override
  State<CheckButton> createState() => _CheckButtonState();
}

class _CheckButtonState extends State<CheckButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              widget.checked = !widget.checked!;
              widget.onChanged!(widget.checked!);
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    color:
                        widget.checked!
                            ? Theme.of(context).secondaryHeaderColor
                            : Colors.white,
                    border: Border.all(
                      color: Theme.of(context).secondaryHeaderColor,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                widget.checked!
                    ? const Icon(Icons.check, color: Colors.white, size: 10)
                    : SizedBox(),
              ],
            ),
          ),
        ),
        Text(
          'Remember me',
          style: TextStyle(
            color: AppColors.darkGrey,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
