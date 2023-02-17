import 'package:wall_e/core/app_size/app_size.dart';
import 'package:wall_e/core/router/app_route.dart';
import 'package:wall_e/source/widget/appbar/appbar.dart';
import 'package:wall_e/source/widget/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:wall_e/source/widget/textfield/custom_textformfield_widget.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: MyAppBar(
        title: 'Reset Password',
        leadingIcon: true,
        onPressed: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: AppSize.spacedViewSpacing,
                left: AppSize.viewMargin,
                right: AppSize.viewMargin,
              ),
              child: Text(
                textAlign: TextAlign.center,
                'Enter email to send the otp code',
                style: theme.textTheme.titleMedium,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: AppSize.viewMargin,
                left: AppSize.viewMargin,
                right: AppSize.viewMargin,
              ),
              child: CustomTextField(
                hintText: 'Enter your email',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: AppSize.spacedViewSpacing,
                left: AppSize.viewMargin,
                right: AppSize.viewMargin,
              ),
              child: CustomElevatedButton(
                buttonText: 'Next',
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoute.verifyOtpRoute),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
