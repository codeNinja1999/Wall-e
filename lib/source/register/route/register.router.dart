import 'package:wall_e/core/router/app_route.dart';
import 'package:wall_e/source/register/pages/signup_address_information_page.dart';
import 'package:wall_e/source/register/pages/signup_email_otp_verify_page.dart';
import 'package:wall_e/source/register/pages/signup_personal_information_page.dart';
import 'package:wall_e/source/register/pages/signup_screen.dart';
import 'package:wall_e/source/register/route/register_route.dart';
import 'package:flutter/material.dart';
import 'package:wall_e/source/register/pages/signup_success_page.dart';

class RegisterRouter {
  Route<dynamic> onGenerateRoute(RouteSettings settings, BuildContext context) {
    switch (settings.name) {
      case RegisterRoute.signup:
        return MaterialPageRoute(
          builder: (_) => SignUpScreen(
            onLogin: () {
              Navigator.pushNamed(context, AppRoute.loginScreen);
            },
          ),
        );

      case RegisterRoute.personalInformation:
        return MaterialPageRoute(
          builder: (_) => const SignupPersonalInformationPage(),
        );

      case RegisterRoute.addressInformation:
        return MaterialPageRoute(
          builder: (_) => const SignupAddressInformationPage(),
        );

      case RegisterRoute.otpVerification:
        return MaterialPageRoute(
          builder: (_) => const SignupEmailOTPVerifyPage(),
        );

      case RegisterRoute.succesSignup:
        return MaterialPageRoute(
          builder: (_) => SignupSuccessPage(
            backButtonAction: (() => Navigator.of(context).pop()),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Placeholder(),
        );
    }
  }
}
