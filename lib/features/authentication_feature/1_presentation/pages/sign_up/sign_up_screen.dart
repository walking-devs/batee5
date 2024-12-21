import 'package:batee5/features/authentication_feature/1_presentation/pages/enter_phone_number/enter_phone_number.dart';
import 'package:batee5/features/authentication_feature/1_presentation/pages/sign_in/sign_in_screen.dart';
import 'package:batee5/features/authentication_feature/1_presentation/pages/widgets/custom_app_bar_leading.dart';
import 'package:batee5/features/authentication_feature/1_presentation/pages/widgets/question_button.dart';
import 'package:batee5/features/authentication_feature/1_presentation/pages/widgets/svg_icon_button.dart';
import 'package:batee5/a_core/constants/app_colors.dart';
import 'package:batee5/a_core/widgets/batee5_app_bar/batee5_app_bar.dart';
import 'package:batee5/features/authentication_feature/1_presentation/pages/widgets/labeled_input_field.dart';
import 'package:batee5/features/authentication_feature/1_presentation/pages/widgets/submit_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? email;

  String? name;

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
          description: 'Create an account',
        ),
        barHeight: height * .233,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: .064 * width),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: LabeledInputField(
                  // TODO: check if email is already taken
                  // errorMessage: emailTaken??"",
                  hint: 'Email',
                  label: 'Email',
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
                  hint: 'Name',
                  label: 'Name',
                  onChanged: (p0) {
                    setState(() {
                      name = p0;
                    });
                    debugPrint(p0);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: SubmitTextButton(
                  text: "Next",
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const EnterPhoneNumber(passwordReset: false),
                      ),
                    );
                  },
                  isEnabled: validate(email, name),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Or Sign Up with",
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
                  questionText: "Already have an account?",
                  buttonText: "Login",
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => SignInScreen()),
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

bool validate(String? email, String? name) {
  if (email == null || name == null || email.isEmpty || name.isEmpty) {
    return false;
  }
  return true;
}
