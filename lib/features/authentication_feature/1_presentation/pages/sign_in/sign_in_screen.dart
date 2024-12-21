// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:batee5/features/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:batee5/features/authentication_feature/1_presentation/pages/enter_phone_number/enter_phone_number.dart';
import 'package:batee5/features/authentication_feature/1_presentation/pages/sign_in/components/check_button.dart';
import 'package:batee5/features/authentication_feature/1_presentation/pages/sign_up/sign_up_screen.dart';
import 'package:batee5/features/authentication_feature/1_presentation/pages/widgets/custom_app_bar_leading.dart';
import 'package:batee5/features/authentication_feature/1_presentation/pages/widgets/labeled_input_field.dart';
import 'package:batee5/features/authentication_feature/1_presentation/pages/widgets/question_button.dart';
import 'package:batee5/features/authentication_feature/1_presentation/pages/widgets/submit_text_button.dart';
import 'package:batee5/features/authentication_feature/1_presentation/pages/widgets/svg_icon_button.dart';
import 'package:batee5/a_core/config/apptheme.dart';
import 'package:batee5/a_core/constants/app_colors.dart';
import 'package:batee5/a_core/widgets/batee5_app_bar/batee5_app_bar.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignInScreen> {
  String? email;

  String? password;
  bool remember = false;
  bool invalidCred = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Batee5AppBar(
        toolbarHeight: height * .25,
        title: CustomAppBarLeading(
          leadingText: "Batee5",
          midText: "Welcome back",
          description: 'log in',
        ),
        barHeight: height * .233,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: .064 * width),
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (invalidCred)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'account information is wrong please try again',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: LabeledInputField(
                  errorBorder: invalidCred,
                  hint: 'Email or phone number',
                  label: 'Email or phone number',
                  onChanged: (p0) {
                    setState(() {
                      email = p0;
                    });
                    debugPrint(p0);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: LabeledInputField(
                  errorBorder: invalidCred,
                  hint: 'Password',
                  label: 'Password',
                  obscure: true,
                  toggleObscurity: true,
                  onChanged: (p0) {
                    setState(() {
                      password = p0;
                    });
                    debugPrint(p0);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CheckButton(
                    onChanged: (p0) {
                      remember = p0;
                      debugPrint(remember.toString());
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              const EnterPhoneNumber(passwordReset: true),
                        ),
                      );
                      debugPrint("Forgot Password?");
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: SubmitTextButton(
                  text: "Log In",
                  onPressed: () {
                    invalidCred = true;
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => const EnterPhoneNumber(
                    //           passwordReset: false,
                    //         )));
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  isEnabled: validate(email, password),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Or login with",
                  style: TextStyle(
                    color: AppColors.darkGrey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgIconButton(
                      iconPath: "assets/icons/google.svg",
                      onPressed: () {
                        debugPrint("Google");
                      },
                    ),
                    SvgIconButton(
                      iconPath: "assets/icons/facebook.svg",
                      onPressed: () {
                        debugPrint("facebook");
                      },
                    ),
                    SvgIconButton(
                      iconPath: "assets/icons/apple.svg",
                      onPressed: () {
                        debugPrint("apple");
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: QuestionButton(
                  questionText: "Don't have an account?",
                  buttonText: "Sign Up",
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

bool validate(String? email, String? password) {
  if (email == null || password == null || email.isEmpty || password.isEmpty) {
    return false;
  }
  return true;
}
