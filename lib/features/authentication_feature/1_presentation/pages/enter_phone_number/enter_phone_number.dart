import 'package:flutter/material.dart';
import 'package:phonecodes/phonecodes.dart';

import 'package:batee5/features/authentication_feature/1_presentation/pages/enter_OTP/enter_OTP.dart';
import 'package:batee5/features/authentication_feature/1_presentation/pages/enter_phone_number/components/phone_text_feild/phone_text_field.dart';
import 'package:batee5/features/authentication_feature/1_presentation/pages/widgets/custom_app_bar_leading.dart';
import 'package:batee5/features/authentication_feature/1_presentation/pages/widgets/submit_text_button.dart';
import 'package:batee5/a_core/constants/app_colors.dart';
import 'package:batee5/a_core/utils/validator.dart';
import 'package:batee5/a_core/widgets/batee5_app_bar/batee5_app_bar.dart';

class EnterPhoneNumber extends StatefulWidget {
  final bool passwordReset;
  const EnterPhoneNumber({super.key, required this.passwordReset});

  @override
  State<EnterPhoneNumber> createState() => _EnterPhoneNumberState();
}

class _EnterPhoneNumberState extends State<EnterPhoneNumber> {
  String phoneNumber = "";
  String phoneCode = "";

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Now it's safe to access the context and get the locale
    Locale locale = Localizations.localeOf(context);
    phoneCode = Countries.findByCode(locale.countryCode ?? "EG").dialCode;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Batee5AppBar(
        toolbarHeight: height * .25,
        title: CustomAppBarLeading(
          backButton: true,
          midText:
              widget.passwordReset ? "Forgot password" : "Enter phone number",
          description: widget.passwordReset
              ? "Please enter the phone number associated with this account "
              : "We will send confiramtion message to number you entered",
        ),
        barHeight: height * .233,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: SizedBox(
            height: height,
            child: Stack(
              children: [
                Column(
                  children: [
                    PhoneTextField(
                      selectedCode: phoneCode,
                      onCodeSelected: (p0) {
                        setState(() {
                          phoneCode = p0;
                        });
                      },
                      onChanged: (value) {
                        setState(() {
                          phoneNumber = value;
                        });
                      },
                      onSubmitted: (value) {
                        setState(() {
                          phoneNumber = value;
                        });
                      },
                    ),
                  ],
                ),
                Align(
                  alignment: const Alignment(0, .05),
                  child: SubmitTextButton(
                    text: "Send confirmation code",
                    onPressed: () {
                      // TODO:Send confirmation code
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              EnterOTP(passwordReset: widget.passwordReset),
                        ),
                      );
                    },
                    isEnabled: Validator.isPhoneNumberValid(phoneNumber),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
