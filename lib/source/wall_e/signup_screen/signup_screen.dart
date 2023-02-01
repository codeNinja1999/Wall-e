// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:wall_e/core/color/theme_color.dart';
import 'package:wall_e/core/utils/keyboard.dart';
import 'package:wall_e/source/wall_e/login_screen/login_screen.dart';
import 'package:wall_e/source/wall_e/utils/check_validation.dart';
import 'package:wall_e/source/wall_e/widget/elevated_button_widget.dart';
import 'package:wall_e/source/wall_e/widget/formfield/textformfield_widget.dart';
import 'package:wall_e/source/wall_e/widget/google_button_widget.dart';
import 'package:wall_e/source/wall_e/widget/or_divider_widget.dart';
import 'package:wall_e/source/wall_e/widget/toggle_login_signup_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _signupFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    confirmPasswordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              // color: ThemeAppColors.lightGrey,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //login
                  Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 25,
                  ),

                  //logintext
                  Text(
                    "Create your new account to start",
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade400),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  //Signup form
                  Form(
                    key: _signupFormKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Full Name',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              //First Name
                              child: TextFormFieldWidget(
                                controller: firstNameController,
                                hintText: 'First Name',
                                obscureText: false,
                                validator: (val) {
                            return CheckValidation.validateFirstName(
                              passwordController.text.trim(),
                            );
                          },
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              //Last Name
                              child: TextFormFieldWidget(
                                controller: lastNameController,
                                hintText: 'Last Name',
                                obscureText: false,
                                validator: (val) {
                            return CheckValidation.validateLastName(
                              passwordController.text.trim(),
                            );
                          },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        //email
                        Text(
                          'Email',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextFormFieldWidget(
                          controller: emailController,
                          hintText: 'Enter your email',
                          obscureText: false,
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
                        TextFormFieldWidget(
                          controller: passwordController,
                          hintText: 'Enter your password',
                          obscureText: true,
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
                        TextFormFieldWidget(
                          controller: confirmPasswordController,
                          hintText: 'Enter your password',
                          obscureText: true,
                          validator: (val) {
                            return CheckValidation.validateConfirmPassword(confirmPasswordController.text.trim(),
                              passwordController.text.trim(),
                            );
                          },
                        ),
                        SizedBox(
                          height: 50,
                        ),

                        //Login button

                        ElevatedButtonWidget(
                          buttonText: 'Create Account',
                          onPressed: () {
                            KeyboardUtil.hideKeyboard(context);
                            if (_signupFormKey.currentState!.validate()) {
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),

                  //or
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        //or divider
                        OrDividerWidget(),
                        SizedBox(
                          height: 20,
                        ),

                        GoogleButtonWidget(googleString: 'Sign Up with Google'),
                        SizedBox(
                          height: 25,
                        ),

                        //text
                        ToggleLoginSignupWidget(
                          accountTypeText: "Already have account?",
                          buttonText: 'Login',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
