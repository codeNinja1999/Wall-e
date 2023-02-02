// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:wall_e/core/color/theme_color.dart';
import 'package:wall_e/core/router/app_route.dart';
import 'package:wall_e/core/utils/keyboard.dart';
import 'package:wall_e/source/login/login_screen.dart';
import 'package:wall_e/source/register/route/register.router.dart';
import 'package:wall_e/source/register/route/register_route.dart';
import 'package:wall_e/source/resources/image_extension.dart';
import 'package:wall_e/source/utils/check_validation.dart';
import 'package:wall_e/source/widget/elevated_button_widget.dart';
import 'package:wall_e/source/widget/formfield/textformfield_password_widget.dart';
import 'package:wall_e/source/widget/formfield/textformfield_text_widget.dart';

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
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            decoration: BoxDecoration(
              color: theme.primaryColorLight,
              // color: ThemeAppColors.lightGrey,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SignUpText(text: 'Sign Up'),
                  const SizedBox(height: 25),
                  CreateAccountText(
                    text: "Create your new account to start",
                  ),
                  const SizedBox(height: 10),
                  SignUpForm(),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
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
      ),
    );
  }
}

class SignUpText extends StatelessWidget {
  const SignUpText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
    );
  }
}

class CreateAccountText extends StatelessWidget {
  const CreateAccountText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 14, color: Colors.grey.shade400),
    );
  }
}

class CustomLogIn extends StatelessWidget {
  const CustomLogIn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have account?",
          style: const TextStyle(fontSize: 12),
        ),

        //clickable button
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
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
    return ElevatedButton(
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
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

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
    final theme = Theme.of(context);
    return Form(
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
          TextFormFieldPasswordWidget(
            showPassword: GestureDetector(
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
            controller: passwordController,
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
          TextFormFieldPasswordWidget(
            showPassword: GestureDetector(
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
            controller: confirmPasswordController,
            hintText: 'Enter your password',
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

          //Login button

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

              Navigator.pushNamed(context, RegisterRoute.userVerify);
            },
          ),
        ],
      ),
    );
  }
}
