import 'package:wall_e/source/sendMoney/router/sendmoney_route.dart';
import 'package:wall_e/source/sendMoney/router/sendmoney_router.dart';
import 'package:flutter/material.dart';

class SendMoneyNavigationPage extends StatelessWidget {
  SendMoneyNavigationPage({Key? key}) : super(key: key);
  final _router = SendmoneyRouter();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: SendmoneyRoute.contactInfo,
      onGenerateRoute: (setting) {
        return _router.onGenerateRoute(setting, context);
      },
    );
  }
}
