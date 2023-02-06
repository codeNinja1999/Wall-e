import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';
import 'package:wall_e/core/app_size/app_size.dart';
import 'package:wall_e/core/color/theme_color.dart';
import 'package:wall_e/core/config/images.dart';
import 'package:wall_e/source/home/presentation/widget/custom_button.dart';
import 'package:wall_e/source/register/route/register_route.dart';
import 'package:wall_e/source/widget/step_header/esstepper_header.dart';

class RegisterOTPVerifyPage extends StatefulWidget {
  const RegisterOTPVerifyPage({Key? key}) : super(key: key);

  @override
  State<RegisterOTPVerifyPage> createState() => _RegisterOTPVerifyPageState();
}

class _RegisterOTPVerifyPageState extends State<RegisterOTPVerifyPage> {
  var formKey = GlobalKey<FormState>();
  late ThemeData theme;
  @override
  Widget build(BuildContext context) {
    theme = Theme.of(context);
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      //appBar: MyAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Header(),
              Padding(
                padding: const EdgeInsets.all(AppSize.viewSpacing),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SVGImage(deviceSize: deviceSize),
                    TitleText(theme: theme),
                    SubtitleText(theme: theme),
                    OtpVerificationForm(theme: theme),
                    DidntReceiveCode(theme: theme),
                    const ResendButton(),
                  ],
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
    return const EsStepperHeader(
      totalStps: 4,
      currentStep: 2,
      title: "OTP Verification",
      description: "Next: Personal Information",
    );
  }
}

class ResendButton extends StatelessWidget {
  const ResendButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Resend Code',
        style: TextStyle(
            decoration: TextDecoration.underline, fontWeight: FontWeight.bold),
        //style: theme.textTheme.bodyMedium,
      ),
    );
  }
}

class DidntReceiveCode extends StatelessWidget {
  const DidntReceiveCode({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: AppSize.cornerRadius, bottom: AppSize.cornerRadiusMedium),
      child: Center(
        child: Text(
          "Don't you recieve any code?",
          style:
              theme.textTheme.bodyMedium?.copyWith(color: ThemeAppColors.grey),
        ),
      ),
    );
  }
}

class SubtitleText extends StatelessWidget {
  const SubtitleText({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSize.cornerRadius),
      child: Text(
        'Enter verification code we just sent on your email address.',
        style: theme.textTheme.bodyMedium?.copyWith(color: ThemeAppColors.grey),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class TitleText extends StatelessWidget {
  const TitleText({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSize.inset),
      child: Text(
        'Enter Code',
        style: theme.textTheme.titleLarge,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class SVGImage extends StatelessWidget {
  const SVGImage({
    Key? key,
    required this.deviceSize,
  }) : super(key: key);

  final Size deviceSize;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      Images.otpcode,
      fit: BoxFit.contain,
      alignment: Alignment.center,
      width: (deviceSize.width * 0.75),
      height: (deviceSize.width) * 0.5,
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
    return Form(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Pinput(
          length: 4,
          // defaultPinTheme: defaultPinTheme,
          defaultPinTheme: PinTheme(
            width: 56,
            height: 56,
            textStyle: TextStyle(
              fontSize: 20,
              color: ThemeAppColors.primaryBlue,
              fontWeight: FontWeight.w600,
            ),
            decoration: BoxDecoration(
              color: ThemeAppColors.light,
              border: Border.all(color: ThemeAppColors.grey),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSize.cornerRadius),
          child: CustomButton(
            onPressed: () {
              Navigator.pushNamed(context, RegisterRoute.personalInformation);
            },
            title: "Verify OTP",
            buttonType: ButtonType.bordered,
          ),
        ),
      ],
    ));
  }
}
