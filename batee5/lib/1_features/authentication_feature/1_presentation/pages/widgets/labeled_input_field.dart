import 'package:batee5/a_core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LabeledInputField extends StatefulWidget {
  final String label;
  final String hint;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  String errorMessage;
  bool obscure;
  bool toggleObscurity;
  bool errorBorder;
  LabeledInputField({
    super.key,
    required this.label,
    this.errorMessage = "",
    this.onChanged,
    this.errorBorder = false,
    this.onSubmitted,
    this.obscure = false,
    this.toggleObscurity = false,
    required this.hint,
  });

  @override
  State<LabeledInputField> createState() => _LabeledInputFieldState();
}

class _LabeledInputFieldState extends State<LabeledInputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextFormField(
          obscuringCharacter: '*',
          obscureText: widget.obscure,
          onFieldSubmitted: (value) {
            if (widget.onSubmitted != null) {
              widget.onSubmitted!(value);
            }
          },
          onChanged: (value) {
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          },
          cursorColor: Colors.black,
          decoration: InputDecoration(
            // suffixIconConstraints: const BoxConstraints(
            //   maxHeight: 16,
            //   maxWidth: 16,
            // ),
            suffixIcon:
                widget.toggleObscurity
                    ? GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.obscure = !widget.obscure;
                        });
                      },
                      child:
                          widget.obscure
                              ? Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: SvgPicture.asset(
                                  'assets/icons/visibility_on.svg',
                                ),
                              )
                              : Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: SvgPicture.asset(
                                  'assets/icons/visibility_off.svg',
                                ),
                              ),
                    )
                    : null,
            hintText: widget.hint,
            hintStyle: TextStyle(
              color: AppColors.midGrey,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                // TODO: Add error bloc listener and show error message accordingly
                color:
                    widget.errorMessage.isNotEmpty || widget.errorBorder
                        ? Colors.red
                        : AppColors.lightGrey,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color:
                    widget.errorMessage.isNotEmpty || widget.errorBorder
                        ? Colors.red
                        : AppColors.lightGrey,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),

        // TODO: Add error bloc listener and show error message accordingly
        if (widget.errorMessage.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              widget.errorMessage,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
      ],
    );
  }
}
