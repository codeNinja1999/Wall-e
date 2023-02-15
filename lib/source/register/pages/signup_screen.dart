import 'package:flutter/material.dart';
import 'package:wall_e/core/color/theme_color.dart';
import 'package:wall_e/core/icons/app_icons.dart';
import 'package:wall_e/core/app_size/app_size.dart';
import 'package:wall_e/core/utils/keyboard.dart';
import 'package:wall_e/source/register/route/register_route.dart';
import 'package:wall_e/source/resources/image_extension.dart';
import 'package:wall_e/source/widget/custom_elevated_button.dart';
import 'package:wall_e/source/widget/step_header/esstepper_header.dart';
import 'package:wall_e/source/widget/textfield/custom_textformfield_widget.dart';

class SignUpScreen extends StatefulWidget {
  final VoidCallback onLogin;
  const SignUpScreen({super.key, required this.onLogin});

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
          padding: const EdgeInsets.symmetric(
              horizontal: AppSize.inset, vertical: AppSize.inset),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Header(),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSize.inset, vertical: AppSize.viewSpacing),
                  decoration: BoxDecoration(
                    color: theme.primaryColorLight,
                    borderRadius: BorderRadius.circular(AppSize.inset),
                  ),
                  child: Column(
                    children: [
                      const SignUpForm(),
                      const CustomDivider(),
                      const SizedBox(height: 20),
                      const GoogleSignInButton(),
                      const SizedBox(height: 25),
                      CustomLogIn(
                        onLogin: widget.onLogin,
                      ),
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
    return const Padding(
      padding: EdgeInsets.only(bottom: AppSize.cornerRadiusSmall),
      child: EsStepperHeader(
        totalStps: 4,
        currentStep: 1,
        title: "Login Information",
        description: "Next: OTP Verification",
      ),
    );
  }
}

class CustomLogIn extends StatefulWidget {
  final VoidCallback onLogin;
  const CustomLogIn({
    Key? key,
    required this.onLogin,
  }) : super(key: key);

  @override
  State<CustomLogIn> createState() => _CustomLogInState();
}

class _CustomLogInState extends State<CustomLogIn> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(
        left: AppSize.viewSpacing,
        right: AppSize.viewSpacing,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already have account?",
            style: theme.textTheme.bodySmall,
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.transparent,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSize.cornerRadiusSmall,
              ),
            ),
            onPressed: () => widget.onLogin(),
            child: Text(
              'Log in',
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.primaryColor,
              ),
            ),
          ),
          // InkWell(
          //   onTap: () => widget.onLogin(),
          //   child: Text(
          //     'Log in',
          //     style: theme.textTheme.titleMedium
          //         ?.copyWith(color: theme.primaryColor),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({Key? key}) : super(key: key);

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
            //----------------google logo
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 15,
              child: Image.asset(
                ImageExtension.googleIcon,
              ),
            ),
            const SizedBox(width: 20),
            Text(
              'Sign Up with Google',
              style: Theme.of(context).textTheme.labelLarge,
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
    return Form(
      key: _signupFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //-------------------email---------------------
          Text('Email', style: theme.textTheme.labelLarge),
          const SizedBox(height: 5),
          CustomTextField(
            textController: emailController,
            hintText: 'Enter your email',
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            // validator: (val) {
            //   return CheckValidation.validateEmail(
            //     emailController.text.trim(),
            //   );
            // },
          ),
          const SizedBox(height: 20),

          //-----------------password---------------
          Text(
            'Password',
            style: theme.textTheme.labelLarge,
          ),
          const SizedBox(height: 5),
          CustomTextField(
            trailingIcon: AppIcon.visibility,
            textController: passwordController,
            textInputAction: TextInputAction.next,
            hintText: 'Enter your password',
            isObscure: true,
            // validator: (val) {
            //   return CheckValidation.validatePassword(
            //     passwordController.text.trim(),
            //   );
            // },
          ),
          const SizedBox(height: 20),

          //------------confirm password--------------------
          Text(
            'Confirm Password',
            style: theme.textTheme.labelLarge,
          ),
          const SizedBox(height: 5),
          CustomTextField(
            trailingIcon: AppIcon.visibility,
            textController: confirmPasswordController,
            hintText: 'Enter your password',
            textInputAction: TextInputAction.done,
            isObscure: true,
          ),
          const SizedBox(height: 50),

          CustomElevatedButton(
            buttonText: 'Create Account',
            onPressed: () {
              KeyboardUtil.hideKeyboard(context);
              Navigator.pushNamed(context, RegisterRoute.otpVerification);
            },
          ),
        ],
      ),
    );
  }
}
