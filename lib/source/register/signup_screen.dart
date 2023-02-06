// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:wall_e/core/app_size/app_size.dart';
import 'package:wall_e/core/color/theme_color.dart';
import 'package:wall_e/core/router/app_route.dart';
import 'package:wall_e/core/utils/keyboard.dart';
import 'package:wall_e/source/register/route/register_route.dart';
import 'package:wall_e/source/resources/image_extension.dart';
import 'package:wall_e/source/utils/check_validation.dart';
import 'package:wall_e/source/widget/elevated_button_widget.dart';
import 'package:wall_e/source/widget/formfield/custom_textformfield_widget.dart';
import 'package:wall_e/source/widget/step_header/esstepper_header.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Header(),
                Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: theme.primaryColorLight,
                    // color: ThemeAppColors.lightGrey,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    children: [
                      // Text(
                      //   'Sign Up',
                      //   style: TextStyle(
                      //       fontSize: 25, fontWeight: FontWeight.bold),
                      // ),
                      // const SizedBox(height: 25),
                      // Text(
                      //   "Create your new account to start",
                      //   style: TextStyle(color: ThemeAppColors.greyShade),
                      // ),
                      // const SizedBox(height: 10),
                      SignUpForm(),
                      CustomDivider(),
                      const SizedBox(height: 20),
                      GoogleSignInButton(theme: theme),
                      const SizedBox(height: 25),
                      CustomLogIn(),
                    ],
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

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EsStepperHeader(
      totalStps: 4,
      currentStep: 1,
      title: "Login Information",
      description: "Next: OTP Verification",
    );
  }
}

class CustomLogIn extends StatelessWidget {
  const CustomLogIn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(AppSize.viewSpacing,
          AppSize.cornerRadiusSmall, AppSize.viewSpacing, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already have account?",
            style: const TextStyle(fontSize: 12),
          ),

          //clickable button
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppRoute.login);
            },
            child: Text(
              'Login',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: ThemeAppColors.primaryBlue),
            ),
          ),
        ],
      ),
    );
  }
}

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(AppSize.viewSpacing,
          AppSize.cornerRadiusMedium, AppSize.viewSpacing, 0),
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Not Implemented yet'),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.primaryColorLight,
          minimumSize: const Size(double.infinity, 45),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //google logo
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 15,
              child: Image.asset(
                ImageExtension.googleIcon,
              ),
            ),
            const SizedBox(width: 20),

            //button
            const Text(
              'Sign Up with Google',
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(AppSize.cornerRadiusMedium,
          AppSize.viewSpacing, AppSize.cornerRadiusMedium, 0),
      child: Row(
        children: [
          const Expanded(child: Divider(endIndent: 10)),
          Text(
            'or',
            style: TextStyle(color: Colors.grey.shade400),
          ),
          const Expanded(
            child: Divider(indent: 10),
          ),
        ],
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _signupFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      //padding: EdgeInsets.all(0),
      padding: const EdgeInsets.fromLTRB(0, AppSize.cornerRadius, 0, 0),
      child: Form(
        key: _signupFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //email
            Text(
              'Email',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            CustomTextFormField(
              textController: emailController,
              hintText: 'Enter your email',
              cursorColor: theme.primaryColor,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              validator: (val) {
                return CheckValidation.validateEmail(
                  emailController.text.trim(),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),

            //password
            Text(
              'Password',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            CustomTextFormField(
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
                child: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: theme.primaryColor,
                ),
              ),
              textController: passwordController,
              hintText: 'Enter your password',
              obscureText: _passwordVisible ? false : true,
              validator: (val) {
                return CheckValidation.validatePassword(
                  passwordController.text.trim(),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),

            //confirm password
            Text(
              'Confirm Password',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            CustomTextFormField(
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _confirmPasswordVisible = !_confirmPasswordVisible;
                  });
                },
                child: Icon(
                  _confirmPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  color: theme.primaryColor,
                ),
              ),
              textController: confirmPasswordController,
              hintText: 'Enter your password',
              textInputAction: TextInputAction.next,
              obscureText: _confirmPasswordVisible ? false : true,
              validator: (val) {
                return CheckValidation.validateConfirmPassword(
                  confirmPasswordController.text.trim(),
                  passwordController.text.trim(),
                );
              },
            ),
            SizedBox(
              height: 50,
            ),

            ElevatedButtonWidget(
              buttonText: 'Create Account',
              onPressed: () {
                KeyboardUtil.hideKeyboard(context);
                // if (_signupFormKey.currentState!.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     const SnackBar(content: Text('Processing Data')),
                //   );
                // }

                Navigator.pushNamed(context, RegisterRoute.otpVerification);
              },
            ),
          ],
        ),
      ),
    );
  }
}
