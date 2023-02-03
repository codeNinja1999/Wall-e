import 'package:flutter/material.dart';
import 'package:wall_e/source/reciever/router/beneficiary_route.dart';
import 'package:wall_e/source/reciever/router/beneficiary_router.dart';

class RecieverNavigationPage extends StatefulWidget {
  const RecieverNavigationPage({Key? key}) : super(key: key);

  @override
  State<RecieverNavigationPage> createState() => _RecieverNavigationPageState();
}

class _RecieverNavigationPageState extends State<RecieverNavigationPage> {
  final _router = BeneficiaryRouter();
  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: BeneficiaryRoute.sendMoney,
      onGenerateRoute: (settings) {
        return _router.onGenerateRoute(settings, context);
      },
    );
  }
}
