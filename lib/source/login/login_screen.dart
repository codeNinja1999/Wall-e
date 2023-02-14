import 'package:wall_e/core/config/images.dart';
import 'package:wall_e/core/icons/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:wall_e/core/app_size/app_size.dart';
import 'package:wall_e/core/color/theme_color.dart';
import 'package:wall_e/core/router/app_route.dart';
import 'package:wall_e/core/utils/keyboard.dart';
import 'package:wall_e/source/widget/custom_elevated_button.dart';
import 'package:wall_e/source/widget/textfield/custom_textformfield_widget.dart';
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
          padding: const EdgeInsets.symmetric(
              horizontal: AppSize.inset, vertical: AppSize.viewMargin * 2),
          child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSize.inset, vertical: AppSize.viewSpacing),
            decoration: BoxDecoration(
              color: theme.primaryColorLight,
              borderRadius: BorderRadius.circular(AppSize.inset),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  LoginText(),
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: AppSize.inset, bottom: AppSize.viewMargin * 2),
      child: Column(
        children: [
          Text(
            'Login',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: ThemeAppColors.black),
          ),
          const SizedBox(height: 10),
          Text(
            "Welcome back, let's continue to login",
            style: TextStyle(fontSize: 14, color: ThemeAppColors.greyShade),
          ),
        ],
      ),
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _loginFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //------------------email----------------------
          const Text(
            'Email',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          CustomTextField(
            textController: emailController,
            hintText: 'Enter your email',
            textInputAction: TextInputAction.next,
            // validator: (val) {
            //   return CheckValidation.validateEmail(
            //     emailController.text.trim(),
            //   );
            // },
          ),
          const SizedBox(height: 20),

          //----------------password-------------------
          const Text(
            'Password',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          CustomTextField(
            trailingIcon: AppIcon.visibility,
            isObscure: true,
            textInputAction: TextInputAction.done,
            textController: passwordController,
            hintText: 'Enter your password',
            // validator: (val) {
            //   return CheckValidation.validatePassword(
            //     passwordController.text.trim(),
            //   );
            // },
          ),
          const SizedBox(height: 5),

          //----------------forgot password---------------------
          Align(
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
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Theme.of(context).primaryColor),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),

          //------------------Login button------------------------
          CustomElevatedButton(
            buttonText: 'Login',
            onPressed: () {
              KeyboardUtil.hideKeyboard(context);
              Navigator.pushNamed(context, AppRoute.homeScreen);
              // final email = emailController.text.trim();
              // final password = passwordController.text.trim();
              // if (_loginFormKey.currentState!.validate()) {
              // If the form is valid, display a snackbar. In the real world,
              // you'd often call a server or save the information in a database.
              //     ),
              //   );
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
      padding: const EdgeInsets.only(
        left: AppSize.cornerRadiusMedium,
        top: AppSize.viewSpacing,
        right: AppSize.cornerRadiusMedium,
      ),
      child: Row(
        children: [
          const Expanded(child: Divider(endIndent: 10)),
          Text(
            'or',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: ThemeAppColors.greyShade),
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
      child:
          // CustomTextButton(
          //     onPressed: () {},
          //     title: 'Login with Google',
          //     buttonType: ButtonType.round),

          ElevatedButton(
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
            //--------------------google logo
            CircleAvatar(
              radius: 15,
              backgroundColor: Colors.transparent,
              child: Image.asset(
                Images.googleIcon,
              ),
            ),
            const SizedBox(width: 20),
            Text('Login with Google',
                style: Theme.of(context).textTheme.labelLarge),
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
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSize.viewSpacing,
        vertical: AppSize.cornerRadiusSmall,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have a account?",
            style: theme.textTheme.bodySmall,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppRoute.signupScreen);
            },
            child: Text(
              'Sign Up',
              style: theme.textTheme.titleMedium
                  ?.copyWith(color: theme.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
