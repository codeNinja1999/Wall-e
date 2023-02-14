
import 'package:flutter/material.dart';
import 'package:wall_e/source/beneficiary/pages/beneficiary_payout_info_page.dart';
import 'package:wall_e/source/beneficiary/router/beneficiary_route.dart';
import 'package:wall_e/source/beneficiary/pages/beneficiary_contact_info_page.dart';
import 'package:wall_e/source/beneficiary/pages/beneficiary_personal_info_page.dart';
import 'package:wall_e/source/beneficiary/pages/beneficiary_success_page.dart';

class BeneficiaryRouter {
  Route<dynamic> onGenerateRoute(RouteSettings settings, BuildContext context) {
    switch (settings.name) {
      case BeneficiaryRoute.personalDetailPage:
        return MaterialPageRoute(
          fullscreenDialog: true,
          builder: (_) => BeneficiaryPersonalInformationPage(
            backButtonaction: () {
              Navigator.pop(context);
            },
          ),
        );

      case BeneficiaryRoute.contactInformationPage:
        return MaterialPageRoute(
          fullscreenDialog: true,
          builder: (_) => const BeneficiaryContactInformationPage(),
        );
      case BeneficiaryRoute.payoutInfoPage:
        return MaterialPageRoute(
          fullscreenDialog: true,
          builder: (_) => const BeneficiaryPayoutInfoPage(),
        );

      case BeneficiaryRoute.successBeneficiaryPage:
        return MaterialPageRoute(
          fullscreenDialog: true,
          builder: (_) =>  BeneficiarySuccessPage(
            backButtonaction: () => Navigator.pop(context),
          ),
        );

      default:
        return MaterialPageRoute(
          fullscreenDialog: true,
          builder: (_) => const Placeholder(),
        );
    }
  }
}
