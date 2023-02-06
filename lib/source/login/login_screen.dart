import 'package:flutter/material.dart';
import 'package:wall_e/core/app_size/app_size.dart';
import 'package:wall_e/core/color/theme_color.dart';
import 'package:wall_e/core/router/app_route.dart';
import 'package:wall_e/core/utils/keyboard.dart';
import 'package:wall_e/source/resources/image_extension.dart';
import 'package:wall_e/source/utils/check_validation.dart';
import 'package:wall_e/source/widget/elevated_button_widget.dart';
import 'package:wall_e/source/widget/formfield/custom_textformfield_widget.dart';
import 'package:wall_e/source/widget/forgot_password/forgot_password_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  //login
                  LoginText(text: 'Login'),
                  SizedBox(height: 10),
                  WelcomeText(text: "Welcome back, let's continue to login"),
                  SizedBox(height: 50),
                  LoginForm(),
                  CustomDivider(),
                  SizedBox(height: 20),
                  GoogleSigninButton(),
                  SizedBox(height: 25),
                  SignUpButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginText extends StatelessWidget {
  const LoginText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: ThemeAppColors.black),
    );
  }
}

class WelcomeText extends StatelessWidget {
  const WelcomeText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 14, color: ThemeAppColors.greyShade),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
  void initState() {
    super.initState();
  }

  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //email
          const Text(
            'Email',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          CustomTextFormField(
            textController: emailController,
            hintText: 'Enter your email',
            textInputAction: TextInputAction.next,
            validator: (val) {
              return CheckValidation.validateEmail(
                emailController.text.trim(),
              );
            },
          ),
          const SizedBox(height: 20),

          //password
          const Text(
            'Password',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          CustomTextFormField(
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
              child: Icon(
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: Theme.of(context).primaryColor,
              ),
            ),
            textInputAction: TextInputAction.next,
            textController: passwordController,
            hintText: 'Enter your password',
            obscureText: _passwordVisible ? false : true,
            validator: (val) {
              return CheckValidation.validatePassword(
                passwordController.text.trim(),
              );
            },
          ),
          const SizedBox(height: 5),

          //forgot password
          Container(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgotPassword(),
                  ),
                );
              },
              child: Text(
                'Forgot Password?',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),

          //Login button

          ElevatedButtonWidget(
            buttonText: 'Login',
            onPressed: () {
              KeyboardUtil.hideKeyboard(context);
              final email = emailController.text.trim();
              final password = passwordController.text.trim();

              // if (_loginFormKey.currentState!.validate()) {
              //   // If the form is valid, display a snackbar. In the real world,
              //   // you'd often call a server or save the information in a database.
              //   ScaffoldMessenger.of(context).showSnackBar(
              //     const SnackBar(
              //       duration: Duration(seconds: 2),
              //       content: Text('Processing Data'),
              //     ),
              //   );
              _login(email, password);
              // }
            },
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

class GoogleSigninButton extends StatelessWidget {
  const GoogleSigninButton({
    Key? key,
  }) : super(key: key);

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
          backgroundColor: Theme.of(context).primaryColorLight,
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
              'Login with Google',
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({
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
          const Text(
            "Don't have a account?",
            style: TextStyle(fontSize: 12),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppRoute.register);
            },
            child: Text(
              'Sign Up',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
