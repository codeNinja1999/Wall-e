import 'package:flutter/material.dart';
import 'package:wall_e/core/icons/app_icons.dart';
import 'package:wall_e/source/resources/image_extension.dart';
import 'package:wall_e/source/widget/exit_app_widget/exit_app_widget.dart';
import 'package:wall_e/core/app_size/app_size.dart';
import 'package:wall_e/core/color/theme_color.dart';
import 'package:wall_e/core/router/app_route.dart';
import 'package:wall_e/core/utils/keyboard.dart';
import 'package:wall_e/source/widget/custom_elevated_button.dart';
import 'package:wall_e/source/widget/textfield/custom_textformfield_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return WillPopScope(
      onWillPop: () => PopApp.popApp(context),
      child: Scaffold(
        backgroundColor: theme.backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSize.viewMargin,
              vertical: AppSize.spacedViewSpacing,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSize.inset,
                vertical: AppSize.viewSpacing,
              ),
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
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(
          top: AppSize.inset, bottom: AppSize.spacedViewSpacing),
      child: Column(
        children: [
          Text(
            'Login',
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(height: 10),
          Text(
            "Welcome, let's continue to login",
            style: theme.textTheme.bodyMedium
                ?.copyWith(color: ThemeAppColors.greyShade),
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
    final theme = Theme.of(context);
    return Form(
      key: _loginFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //------------------email----------------------
          Text(
            'Email',
            style: theme.textTheme.labelLarge,
          ),
          const SizedBox(height: 5),
          CustomTextField(
            textController: emailController,
            hintText: 'Enter your email',
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 20),

          //----------------password-------------------
          Text(
            'Password',
            style: theme.textTheme.labelLarge,
          ),
          const SizedBox(height: 5),
          CustomTextField(
            trailingIcon: AppIcon.visibility,
            isObscure: true,
            textInputAction: TextInputAction.done,
            textController: passwordController,
            hintText: 'Enter your password',
          ),

          //----------------forgot password-------------------
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                padding: EdgeInsets.zero,
              ),
              onPressed: () =>
                  Navigator.pushNamed(context, AppRoute.forgotPassword),
              child: Text(
                'Forgot Password?',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Theme.of(context).primaryColor),
              ),
            ),
          ),
          const SizedBox(height: 50),

          //------------------Login button----------------------
          CustomElevatedButton(
            buttonText: 'Login',
            onPressed: () {
              KeyboardUtil.hideKeyboard(context);
              Navigator.pushNamed(context, AppRoute.homeScreen);
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
      padding: const EdgeInsets.only(
        left: AppSize.viewSpacing,
        top: AppSize.cornerRadiusMedium,
        right: AppSize.viewSpacing,
      ),
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
            //--------------------google logo
            CircleAvatar(
              radius: 15,
              backgroundColor: Colors.transparent,
              child: Image.asset(
                ImageExtension.googleIcon,
              ),
            ),
            const SizedBox(width: 20),
            Text(
              'Login with Google',
              style: Theme.of(context).textTheme.labelLarge,
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
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSize.viewSpacing,
      ),
      child: Row(
        textBaseline: TextBaseline.alphabetic,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have a account?",
            style: theme.textTheme.bodySmall,
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSize.cornerRadiusSmall,
              ),
            ),
            onPressed: () =>
                Navigator.pushNamed(context, AppRoute.signupScreen),
            child: Text(
              'Sign Up',
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
