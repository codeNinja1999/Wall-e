import 'package:wall_e/source/sendMoney/pages/sendmoney_contact_info_page.dart';
import 'package:wall_e/source/sendMoney/pages/sendmoney_payout_info_page.dart';
import 'package:wall_e/source/sendMoney/pages/sendmoney_success_page.dart';
import 'package:wall_e/source/sendMoney/router/sendmoney_route.dart';
import 'package:flutter/material.dart';

class SendmoneyRouter {
  Route<dynamic> onGenerateRoute(RouteSettings settings, BuildContext context) {
    switch (settings.name) {
      case SendmoneyRoute.contactInfo:
        return MaterialPageRoute(
          fullscreenDialog: true,
          builder: (_) => SendmoneyContactInformationPage(
              backButtonAction: () => Navigator.pop(context)),
        );

      case SendmoneyRoute.payoutInfo:
        return MaterialPageRoute(
            fullscreenDialog: true,
            builder: (_) => const SendmoneyPayoutInfoPage());

      case SendmoneyRoute.successSendmoney:
        return MaterialPageRoute(
          fullscreenDialog: true,
          builder: (_) => SendmoneySuccessPage(
              backButtonAction: () => Navigator.of(context).pop()),
        );

      default:
        return MaterialPageRoute(builder: (_) => const Placeholder());
    }
  }
}
