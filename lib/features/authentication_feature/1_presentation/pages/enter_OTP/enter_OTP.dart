import 'package:batee5/features/authentication_feature/1_presentation/pages/enter_OTP/components/OTP_field.dart';
import 'package:batee5/features/authentication_feature/1_presentation/pages/password_screen/password_screen.dart';
import 'package:batee5/features/authentication_feature/1_presentation/pages/widgets/custom_app_bar_leading.dart';
import 'package:batee5/features/authentication_feature/1_presentation/pages/widgets/question_button.dart';
import 'package:batee5/features/authentication_feature/1_presentation/pages/widgets/submit_text_button.dart';
import 'package:batee5/a_core/constants/app_colors.dart';
import 'package:batee5/a_core/utils/validator.dart';
import 'package:batee5/a_core/widgets/batee5_app_bar/batee5_app_bar.dart';
import 'package:flutter/material.dart';

class EnterOTP extends StatefulWidget {
  final bool passwordReset;
  const EnterOTP({super.key, required this.passwordReset});

  @override
  State<EnterOTP> createState() => _EnterOTPState();
}

class _EnterOTPState extends State<EnterOTP> {
  bool loading = false;
  int time = 30;
  String inputOTP = '';
  String realOTP = '1234';
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: Batee5AppBar(
        toolbarHeight: height * .25,
        title: CustomAppBarLeading(
          backButton: true,
          midText: "Enter OTP",
          description:
              "We will send you a message with confirmation code please enter below",
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
                    OTPField(
                      otp: realOTP,
                      numberOfFields: 4,
                      onChanged: (val) {
                        setState(() {
                          inputOTP = val;
                        });
                        print(val);
                      },
                    ),
                    const SizedBox(height: 73),
                    Validator.validateOTP(inputOTP, realOTP)
                        ? SizedBox()
                        : loading
                            ? Text(
                                "0 : $time",
                                style: TextStyle(
                                  color: AppColors.darkGrey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            : QuestionButton(
                                onPressed: () async {
                                  setState(() {
                                    loading = true;
                                  });
                                  for (var i = 0; i < 30; i++) {
                                    await Future.delayed(
                                      const Duration(seconds: 1),
                                      () {
                                        time = time - 1;
                                        setState(() {});
                                      },
                                    );
                                  }

                                  setState(() {
                                    time = 30;
                                    loading = false;
                                  });
                                  print("Resend OTP");
                                },
                                questionText: 'Didn’t receive message ?',
                                buttonText: 'Resend OTP',
                              ),
                    SizedBox(height: 40),
                    SubmitTextButton(
                      text: "Next",
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PasswordScreen(
                              passwordReset: widget.passwordReset,
                            ),
                          ),
                        );
                      },
                      isEnabled: Validator.validateOTP(inputOTP, realOTP),
                    ),
                  ],
                ),
                // Align(
                //   alignment: const Alignment(0, .05),
                //   child:
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
