import 'package:wall_e/source/ui/register/route/register.router.dart';
import 'package:flutter/material.dart';
import 'package:wall_e/source/ui/register/route/register_route.dart';

class RegisterNavigationPage extends StatelessWidget {
  RegisterNavigationPage({Key? key}) : super(key: key);
  final _router = RegisterRouter();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: RegisterRoute.signup,
      onGenerateRoute: (setting) {
        return _router.onGenerateRoute(setting, context);
      },
    );
  }
}
