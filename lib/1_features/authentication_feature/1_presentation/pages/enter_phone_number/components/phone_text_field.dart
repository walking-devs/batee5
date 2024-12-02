import 'package:batee5/1_features/authentication_feature/1_presentation/pages/enter_phone_number/components/phone_text_feild/custom_drop_down_menu.dart';
import 'package:batee5/a_core/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:phonecodes/phonecodes.dart';

class PhoneTextField extends StatefulWidget {
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final Function(String)? onCodeSelected;
  String selectedCode;

  PhoneTextField({
    super.key,
    this.onChanged,
    this.onSubmitted,
    this.onCodeSelected,
    required this.selectedCode,
  });

  @override
  State<PhoneTextField> createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {
  List<String> countryCodes = [];
  String phoneNumber = '';
  TextEditingController controller = TextEditingController();
  bool enabled = false;
  String errorMessage = '';
  late Locale locale;
  @override
  void initState() {
    super.initState();

    // Initializing countryCodes before the context is used
    countryCodes = Countries.list.map((e) => e.dialCode).toList();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.topLeft,
          children: [
            Container(
              height: width * .12 > 46 ? 46 : width * .12,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: width * .25 > 92 ? 92 : width * .25),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: controller,
                      onFieldSubmitted: (value) {
                        if (value.contains('+')) {
                          controller.text = '';
                          setState(() {
                            countryCodes =
                                Countries.list.map((e) => e.dialCode).toList();
                            enabled = false;
                          });
                        }
                        if (Validator.isPhoneNumberValid(phoneNumber)) {
                          errorMessage = '';
                        } else {
                          errorMessage =
                              'This phone number is invalid please try again';
                        }
                        if (widget.onSubmitted != null) {
                          widget.onSubmitted!(value);
                        }
                      },
                      onChanged: (value) {
                        setState(() {
                          print(controller.text);
                          value = value.replaceAll(RegExp(r'[^0-9-+]'), '');
                          controller.text = value;
                          controller.selection = TextSelection.fromPosition(
                            TextPosition(offset: value.length),
                          );

                          if (value.startsWith('+')) {
                            enabled = true;
                            countryCodes =
                                Countries.list
                                    .where(
                                      (element) =>
                                          element.dialCode.contains(value),
                                    )
                                    .map((e) => e.dialCode)
                                    .toList();
                          }
                          phoneNumber = controller.text;
                        });
                        if (widget.onChanged != null) {
                          widget.onChanged!(value);
                        }
                      },
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        hintText: "Enter your phone number",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: CustomDropDownMenu(
                enabled: enabled,
                onSelected: (p0) {
                  controller.text = '';
                  setState(() {
                    widget.selectedCode = p0;
                    enabled = false;
                  });
                  if (widget.onCodeSelected != null) {
                    widget.onCodeSelected!(p0);
                  }
                },
                innitialValue: widget.selectedCode!,
                items: countryCodes,
                width: width * .25 > 92 ? 92 : width * .25,
                height: width * .1 > 40 ? 40 : width * .1,
              ),
            ),
          ],
        ),
        Text(
          errorMessage,
          style: TextStyle(
            color: Colors.red,
            fontSize: width * .04 > 14 ? 14 : width * .04,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
