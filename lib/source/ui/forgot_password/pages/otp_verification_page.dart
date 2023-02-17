import 'package:wall_e/core/app_size/app_size.dart';
import 'package:wall_e/core/color/theme_color.dart';
import 'package:wall_e/core/router/app_route.dart';
import 'package:wall_e/source/widget/appbar/appbar.dart';
import 'package:wall_e/source/widget/custom_elevated_button.dart';
import 'package:wall_e/source/widget/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:wall_e/source/widget/textfield/custom_textformfield_widget.dart';

class VerifyOtpPage extends StatefulWidget {
  const VerifyOtpPage({super.key});

  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: MyAppBar(
        title: 'Email Verification',
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
                'Enter the otp from the mail you have provided',
                style: theme.textTheme.titleMedium,
              ),
            ),
            const OtpVerificationForm(),
            const Padding(
              padding: EdgeInsets.only(
                top: AppSize.viewMargin,
                left: AppSize.viewMargin,
                right: AppSize.viewMargin,
              ),
              child: CustomTextField(
                hintText: 'Enter your new Password',
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: AppSize.inset,
                left: AppSize.viewMargin,
                right: AppSize.viewMargin,
              ),
              child: CustomTextField(
                hintText: 'Enter your new Password again',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: AppSize.viewMargin,
                left: AppSize.viewMargin,
                right: AppSize.viewMargin,
              ),
              child: CustomElevatedButton(
                buttonText: 'Next',
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoute.resetPasswordSuccess),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OtpVerificationForm extends StatelessWidget {
  const OtpVerificationForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(
        top: AppSize.viewMargin,
        left: AppSize.viewMargin,
        right: AppSize.viewMargin,
      ),
      child: Form(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Pinput(
            length: 4,
            defaultPinTheme: PinTheme(
              width: AppSize.spacedViewSpacing,
              height: AppSize.spacedViewSpacing,
              textStyle: TextStyle(
                fontSize: 20,
                color: theme.primaryColor,
                fontWeight: FontWeight.w600,
              ),
              decoration: BoxDecoration(
                color: ThemeAppColors.light,
                border: Border.all(color: ThemeAppColors.grey),
                borderRadius: BorderRadius.circular(AppSize.inset),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSize.cornerRadius),
            child: CustomTextButton(
              onPressed: () {},
              title: "Verify OTP",
              buttonType: ButtonType.bordered,
            ),
          ),
        ],
      )),
    );
  }
}
