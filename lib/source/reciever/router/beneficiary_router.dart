import 'package:flutter/material.dart';
import 'package:wall_e/source/home/presentation/pages/send_money.dart';
import 'package:wall_e/source/reciever/router/beneficiary_route.dart';
import 'package:wall_e/source/reciever/save_reciever/bank_page.dart';
import 'package:wall_e/source/reciever/save_reciever/contact_information_page.dart';
import 'package:wall_e/source/reciever/save_reciever/personalInformation.dart';
import 'package:wall_e/source/reciever/save_reciever/success.dart';

class BeneficiaryRouter {
  Route<dynamic> onGenerateRoute(RouteSettings settings, BuildContext context) {
    switch (settings.name) {
      case BeneficiaryRoute.sendMoney:
        return MaterialPageRoute(
          fullscreenDialog: true,
          builder: (_) => const SendMoneyScreen(),
        );
      case BeneficiaryRoute.personalDetail:
        return MaterialPageRoute(
          fullscreenDialog: true,
          builder: (_) => const PersonalInformationPage(),
        );
      case BeneficiaryRoute.contactInformationPage:
        return MaterialPageRoute(
          fullscreenDialog: true,
          builder: (_) => const ContactInformationPage(),
        );
      case BeneficiaryRoute.bankDetail:
        return MaterialPageRoute(
          fullscreenDialog: true,
          builder: (_) => const BankPage(),
        );

      case BeneficiaryRoute.successBeneficiary:
        return MaterialPageRoute(
          fullscreenDialog: true,
          builder: (_) => const BeneficiarySuccessPage(),
        );

      default:
        return MaterialPageRoute(builder: (_) => const SendMoneyScreen());
    }
  }
}
