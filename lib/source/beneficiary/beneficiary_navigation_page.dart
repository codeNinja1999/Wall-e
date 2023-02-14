import 'package:wall_e/source/beneficiary/router/beneficiary_route.dart';
import 'package:wall_e/source/beneficiary/router/beneficiary_router.dart';
import 'package:flutter/material.dart';


class BeneficiaryNavigationPage extends StatelessWidget {
  BeneficiaryNavigationPage({super.key});

  final _router = BeneficiaryRouter();
  
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: BeneficiaryRoute.personalDetailPage,
      onGenerateRoute: (settings) {
        return _router.onGenerateRoute(settings, context);
      },
    );
  }
}
