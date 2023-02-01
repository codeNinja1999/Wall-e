// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:wall_e/core/color/theme_color.dart';
import 'package:wall_e/core/router/app_route.dart';
import 'package:wall_e/core/utils/keyboard.dart';
import 'package:wall_e/source/home/presentation/pages/homescreen.dart';
import 'package:wall_e/source/wall_e/utils/check_validation.dart';
import 'package:wall_e/source/wall_e/signup_screen/signup_screen.dart';
import 'package:wall_e/source/wall_e/widget/elevated_button_widget.dart';
import 'package:wall_e/source/wall_e/widget/formfield/textformfield_widget.dart';
import 'package:wall_e/source/wall_e/widget/forgot_password/forgot_password_widget.dart';
import 'package:wall_e/source/wall_e/widget/google_button_widget.dart';
import 'package:wall_e/source/wall_e/widget/or_divider_widget.dart';
import 'package:wall_e/source/wall_e/widget/toggle_login_signup_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  //Login using temp credential
  _login(String email, String password) {
    Navigator.pushNamed(context, AppRoute.homepage);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            decoration: BoxDecoration(
              color: theme.primaryColorLight,
              // color: ThemeAppColors.lightGrey,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //login
                  Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  //logintext
                  Text(
                    "Welcome back, let's continue to login",
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade400),
                  ),
                  SizedBox(
                    height: 50,
                  ),

                  Form(
                    key: _loginFormKey,
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
                          height: 5,
                        ),

                        //forgot password
                        Container(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgotPassword(),
                                ),
                              );
                            },
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(color: theme.primaryColor),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),

                        //Login button

                        ElevatedButtonWidget(
                          buttonText: 'Login',
                          onPressed: () {
                            KeyboardUtil.hideKeyboard(context);
                            final email = emailController.text.trim();
                            final password = passwordController.text.trim();

                            if (_loginFormKey.currentState!.validate()) {
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  duration: Duration(seconds: 2),
                                  content: Text('Processing Data'),
                                ),
                              );
                              //This is for temporary
                              _login(email, password);
                            }
                          },
                        ),
                      ],
                    ),
                  ),

                  //divider
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        //or divider
                        OrDividerWidget(),

                        SizedBox(
                          height: 20,
                        ),

                        //login with google
                        GoogleButtonWidget(googleString: 'Login with Google'),

                        SizedBox(
                          height: 25,
                        ),

                        //Signup button

                        ToggleLoginSignupWidget(
                          accountTypeText: "Don't have a account?",
                          buttonText: 'Sign Up',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpScreen(),
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
