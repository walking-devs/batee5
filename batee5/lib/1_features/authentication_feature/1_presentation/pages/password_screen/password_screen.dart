import 'package:batee5/1_features/authentication_feature/1_presentation/pages/widgets/custom_app_bar_leading.dart';
import 'package:batee5/1_features/authentication_feature/1_presentation/pages/widgets/labeled_input_field.dart';
import 'package:batee5/1_features/authentication_feature/1_presentation/pages/widgets/submit_text_button.dart';
import 'package:batee5/a_core/widgets/batee5_app_bar/batee5_app_bar.dart';
import 'package:flutter/material.dart';

class PasswordScreen extends StatefulWidget {
  final bool passwordReset;
  PasswordScreen({super.key, required this.passwordReset});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  double height = 0;

  String password1 = "";

  String password2 = "";

  String errorMessage = "";

  bool errorBorder = false;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: Batee5AppBar(
        toolbarHeight: height * .25,
        title: CustomAppBarLeading(
          backButton: true,
          midText: widget.passwordReset ? "New password" : "Enter Password",
          description:
              widget.passwordReset
                  ? "Please Create new password"
                  : "Please Enter password",
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: LabeledInputField(
                        onChanged: (value) {
                          password1 = value;
                        },
                        label: 'Password',
                        hint: 'Password',
                        obscure: true,
                        errorBorder: errorBorder,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: LabeledInputField(
                        onChanged: (value) {
                          password2 = value;
                        },
                        label: 'Confirm Password',
                        hint: 'Confirm Password',
                        obscure: true,
                        toggleObscurity: true,
                        errorMessage: errorMessage,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment(0, .05),
                  child: SubmitTextButton(
                    isEnabled: true,
                    text:
                        widget.passwordReset
                            ? "Reset Password"
                            : "Create Account",
                    onPressed: () {
                      if (password1 == password2) {
                        setState(() {
                          errorBorder = false;
                          errorMessage = "";
                        });

                        print("Password is $password1");
                      } else {
                        setState(() {
                          errorBorder = true;
                          errorMessage = "Passwords do not match";
                        });
                        print("Passwords do not match");
                      }
                    },
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
