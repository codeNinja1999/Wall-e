import 'package:flutter/material.dart';
import 'package:wall_e/source/login/login_screen.dart';
import 'package:wall_e/source/register/pages/address_information.dart';
import 'package:wall_e/source/register/pages/otp_verify.dart';
import 'package:wall_e/source/register/pages/personal_information.dart';
import 'package:wall_e/source/register/pages/success.dart';
import 'package:wall_e/source/register/pages/user_verify.dart';
import 'package:wall_e/source/register/route/register_route.dart';
import 'package:wall_e/source/register/signup_screen.dart';

class RegisterRouter {
  Route<dynamic> onGenerateRoute(RouteSettings settings, BuildContext context) {
    switch (settings.name) {
      case RegisterRoute.signup:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );

      case RegisterRoute.personalInformation:
        return MaterialPageRoute(
          builder: (_) => const PersonalInformation(),
        );
      case RegisterRoute.addressInformation:
        return MaterialPageRoute(
          builder: (_) => const AddressInformation(),
        );
      case RegisterRoute.otpVerification:
        return MaterialPageRoute(
          builder: (_) => const RegisterOTPVerifyPage(),
        );
      case RegisterRoute.successbeneficiary:
        return MaterialPageRoute(
          builder: (_) => RegisttrationSuccessPage(
            backButtonAction: (() => Navigator.of(context).pop()),
          ),
        );

      case RegisterRoute.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );
    }
  }
}
