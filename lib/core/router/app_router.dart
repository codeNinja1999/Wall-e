import 'package:flutter/material.dart';
import 'package:wall_e/source/history/presentation/pages/historyscreen.dart';
import 'package:wall_e/source/home/presentation/pages/homescreen.dart';
import 'package:wall_e/source/home/presentation/pages/send_money.dart';
import 'package:wall_e/source/home/presentation/pages/topup_page.dart';
import 'package:wall_e/source/wall_e/login_screen/login_screen.dart';
import 'package:wall_e/source/wall_e/signup_screen/signup_screen.dart';
import 'package:wall_e/source/wall_e/splash_screen/splash_screen.dart';
import 'package:wall_e/source/wall_e/widget/forgot_password/forgot_password_widget.dart';

import 'app_route.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings, context) {
    //print('this is route: ${settings.name}');
    switch (settings.name) {
      case AppRoute.startingpage:
        return MaterialPageRoute(builder: ((_) => const SplashScreen()));

      case AppRoute.login:
        return MaterialPageRoute(builder: ((_) => const LoginScreen()));

      case AppRoute.register:
        return MaterialPageRoute(builder: ((_) => const SignUpScreen()));

      case AppRoute.forgotPassword:
        return MaterialPageRoute(builder: ((_) => const ForgotPassword()));

      case AppRoute.history:
        return MaterialPageRoute(builder: ((_) => const HistoryScreen()));

      case AppRoute.homepage:
        return MaterialPageRoute(builder: ((_) => const WelcomePage()));
        
      case AppRoute.topup:
        return MaterialPageRoute(builder: ((_) => const TopUpPage()));

      // case AppRoute.loginsignup:
      // return MaterialPageRoute(builder: ((_) => const LoginSignup()));

      //   case AppRoute.success:
      //   return MaterialPageRoute(
      //       builder: ((_) => const PasswordResetSuccess()));

      // case AppRoute.forgotPasswordotp:
      //   return MaterialPageRoute(builder: ((_) => const ForgotPasswordOTP()));

      // case AppRoute.graphpage:
      //   return MaterialPageRoute(builder: ((_) => GraphPage()));

      // case AppRoute.recieverpage:
      //   return MaterialPageRoute(builder: ((_) => const RecieverPage()));

      // case AppRoute.recieverNavigationPage:
      //   return MaterialPageRoute(
      //       builder: ((_) => const RecieverNavigationPage()));

      case AppRoute.sendmoney:
        return MaterialPageRoute(builder: ((_) => const SendMoneyScreen()));

      // case AppRoute.forgotPasswordsetup:
      //   return MaterialPageRoute(builder: ((_) => const ForgotPasswordSetup()));

      // case AppRoute.more:
      //   return MaterialPageRoute(builder: ((_) => const More()));

      default:
        return MaterialPageRoute(builder: ((_) => const SplashScreen()));
    }
  }
}
