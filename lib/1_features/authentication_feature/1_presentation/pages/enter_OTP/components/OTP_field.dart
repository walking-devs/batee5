import 'package:batee5/a_core/constants/app_colors.dart';
import 'package:batee5/a_core/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OTPField extends StatefulWidget {
  final int numberOfFields;
  final Function(String val) onChanged;
  final String otp;
  const OTPField({
    super.key,
    required this.numberOfFields,
    required this.otp,
    required this.onChanged,
  });

  @override
  State<OTPField> createState() => _OTPFieldState();
}

class _OTPFieldState extends State<OTPField> {
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _controllers;
  double width = 0;
  String currentOtp = '';
  @override
  void initState() {
    super.initState();
    // Initialize FocusNodes and Controllers
    _focusNodes = List.generate(widget.numberOfFields, (_) => FocusNode());
    _controllers = List.generate(
      widget.numberOfFields,
      (_) => TextEditingController(),
    );
  }

  @override
  void dispose() {
    for (var node in _focusNodes) {
      node.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              widget.numberOfFields,
              (index) => Container(
                width: width * .192 / 2,
                height: width * .176 / 2,
                decoration:
                    currentOtp.length == widget.otp.length
                        ? BoxDecoration(
                          border: Border.all(
                            color:
                                Validator.validateOTP(currentOtp, widget.otp)
                                    ? Colors.green
                                    : Colors.red,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.lightGrey,
                        )
                        : BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.lightGrey,
                        ),
                child: Center(
                  child: TextFormField(
                    cursorColor: Colors.black,
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    onChanged: (value) {
                      value = value.replaceAll(RegExp(r'[^0-9-+]'), '');

                      if (value.isNotEmpty &&
                          index < widget.numberOfFields - 1) {
                        // Move to the next field
                        FocusScope.of(
                          context,
                        ).requestFocus(_focusNodes[index + 1]);
                      } else if (value.isEmpty && index > 0) {
                        // Move to the previous field if backspace is pressed
                        FocusScope.of(
                          context,
                        ).requestFocus(_focusNodes[index - 1]);
                      }

                      // Update the current OTP
                      currentOtp = _controllers.map((e) => e.text).join();
                      widget.onChanged(currentOtp);
                      print("otp:$currentOtp");
                    },
                    textAlign: TextAlign.center,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(
                        1,
                      ), // Limit to 1 character
                    ],
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (currentOtp.length == widget.otp.length)
            Validator.validateOTP(currentOtp, widget.otp)
                ? const SizedBox()
                : Text(
                  "The code is Wrong please try again",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: width * .04 > 14 ? 14 : width * .04,
                    fontWeight: FontWeight.w500,
                  ),
                ),
        ],
      ),
    );
  }
}
