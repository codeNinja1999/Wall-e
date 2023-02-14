import 'package:wall_e/source/register/route/register_route.dart';
import 'package:wall_e/source/widget/custom_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';
import 'package:wall_e/core/app_size/app_size.dart';
import 'package:wall_e/core/color/theme_color.dart';
import 'package:wall_e/core/config/images.dart';
import 'package:wall_e/source/widget/step_header/esstepper_header.dart';

class SignupEmailOTPVerifyPage extends StatefulWidget {
  const SignupEmailOTPVerifyPage({Key? key}) : super(key: key);

  @override
  State<SignupEmailOTPVerifyPage> createState() =>
      _SignupEmailOTPVerifyPageState();
}

class _SignupEmailOTPVerifyPageState extends State<SignupEmailOTPVerifyPage> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Header(),
              const SVGImage(),
              const TitleText(),
              OtpVerificationForm(theme: theme),
              Padding(
                padding: const EdgeInsets.only(top: AppSize.cornerRadiusMedium),
                child: Text(
                  "Don't you recieve any code?",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: ThemeAppColors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: AppSize.cornerRadiusMedium),
                child: InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Resending code..'),
                      duration: Duration(seconds: 2),
                    ));
                  },
                  child: Text(
                    'Resend Code',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(decoration: TextDecoration.underline),
                  ),
                ),
              ),
            ],
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
      padding: EdgeInsets.all(AppSize.cornerRadiusMedium),
      child: EsStepperHeader(
        totalStps: 4,
        currentStep: 2,
        title: "OTP Verification",
        description: "Next: Personal Information",
      ),
    );
  }
}

class SVGImage extends StatelessWidget {
  const SVGImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSize.viewMargin, vertical: AppSize.inset),
      child: SvgPicture.asset(
        Images.otpcode,
        height: (deviceSize.height) / 4,
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  const TitleText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.viewSpacing),
      child: Column(
        children: [
          Text('Enter Code', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 5),
          Text(
            'Enter verification code we just sent on your email address.',
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: ThemeAppColors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class OtpVerificationForm extends StatelessWidget {
  const OtpVerificationForm({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.viewMargin),
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
                color: ThemeAppColors.primaryBlue,
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
              onPressed: () => Navigator.pushNamed(
                  context, RegisterRoute.personalInformation),
              title: "Verify OTP",
              buttonType: ButtonType.bordered,
            ),
          ),
        ],
      )),
    );
  }
}
