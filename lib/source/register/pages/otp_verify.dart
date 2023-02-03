import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
              const EsStepperHeader(
                totalStps: 4,
                currentStep: 2,
                title: "OTP Verification",
                description: "Next: Personal Information",
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Images.otpcode,
                      fit: BoxFit.contain,
                      alignment: Alignment.center,
                      width: (deviceSize.width * 0.75),
                      height: (deviceSize.width) * 0.5,
                    ),
                    EnterCodeText(theme: theme),
                    EnterVerificationText(theme: theme),
                    OtpVerificationForm(theme: theme),
                    const SizedBox(height: 10),
                    CustomButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, RegisterRoute.personalInformation);
                      },
                      title: "Verify OTP",
                      buttonType: ButtonType.bordered,
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: AppSize.cornerRadiusMedium,
                          bottom: AppSize.cornerRadiusMedium),
                      child: Center(
                        child: Text(
                          'Dont you recieve any code?',
                          style: theme.textTheme.bodyMedium
                              ?.copyWith(color: ThemeAppColors.grey),
                        ),
                      ),
                    ),
                    const Center(
                      child: Text(
                        'Resend Code',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold),
                        //style: theme.textTheme.bodyMedium,
                      ),
                    ),
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

class EnterVerificationText extends StatelessWidget {
  const EnterVerificationText({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSize.cornerRadiusMedium),
      child: Text(
        'Enter verification code we just sent on your email address.',
        style: theme.textTheme.bodyLarge?.copyWith(color: ThemeAppColors.grey),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class EnterCodeText extends StatelessWidget {
  const EnterCodeText({
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

final defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: const TextStyle(
      fontSize: 20,
      color: Color.fromRGBO(30, 60, 87, 1),
      fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
    border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
    borderRadius: BorderRadius.circular(20),
  ),
);

class OtpVerificationForm extends StatelessWidget {
  const OtpVerificationForm({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Pinput(
          length: 4,
          // focusedPinTheme: defaultPinTheme.copyDecorationWith(
          //   border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
          //   borderRadius: BorderRadius.circular(8),
          // ),
          disabledPinTheme: PinTheme(
            width: 56,
            height: 56,
            textStyle: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(30, 60, 87, 1),
                fontWeight: FontWeight.w600),
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),

        // SizedBox(
        //   height: 68,
        //   width: 64,
        //   child: TextField(
        //     style: theme.textTheme.titleLarge,
        //     keyboardType: TextInputType.number,
        //     textInputAction: TextInputAction.next,
        //     textAlign: TextAlign.center,
        //     inputFormatters: [
        //       LengthLimitingTextInputFormatter(1),
        //       FilteringTextInputFormatter.digitsOnly,
        //     ],
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.only(left: 8, right: 8),
        //   child: SizedBox(
        //     height: 68,
        //     width: 64,
        //     child: TextField(
        //       style: theme.textTheme.titleLarge,
        //       keyboardType: TextInputType.number,
        //       textAlign: TextAlign.center,
        //       inputFormatters: [
        //         LengthLimitingTextInputFormatter(1),
        //         FilteringTextInputFormatter.digitsOnly,
        //       ],
        //     ),
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.only(right: 4.0),
        //   child: SizedBox(
        //     height: 68,
        //     width: 64,
        //     child: TextField(
        //       style: theme.textTheme.titleLarge,
        //       keyboardType: TextInputType.number,
        //       textAlign: TextAlign.center,
        //       inputFormatters: [
        //         LengthLimitingTextInputFormatter(1),
        //         FilteringTextInputFormatter.digitsOnly,
        //       ],
        //     ),
        //   ),
        // ),
        // Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: SizedBox(
        //     height: 68,
        //     width: 64,
        //     child: TextField(
        //       style: theme.textTheme.titleLarge,
        //       keyboardType: TextInputType.number,
        //       textAlign: TextAlign.center,
        //       inputFormatters: [
        //         LengthLimitingTextInputFormatter(1),
        //         FilteringTextInputFormatter.digitsOnly,
        //       ],
        //     ),
        //   ),
        // ),
      ],
    ));
  }
}
