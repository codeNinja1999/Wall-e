import 'package:flutter/material.dart';
import 'package:wall_e/source/beneficiary/beneficiary_navigation_page.dart';
import 'package:wall_e/source/beneficiary/pages/beneficiary_screen.dart';
import 'package:wall_e/source/beneficiary/pages/beneficiary_details_page.dart';
import 'package:wall_e/source/bottomnvaigationbar/bottomnavigationbar.dart';
import 'package:wall_e/source/history/pages/historyscreen.dart';
import 'package:wall_e/source/home/features/topup/topup_page.dart';
import 'package:wall_e/source/home/features/topup/topup_payment_page.dart';
import 'package:wall_e/source/home/features/topup/transaction_success_page.dart';
import 'package:wall_e/source/login/login_screen.dart';
import 'package:wall_e/source/onboard_screen/onboard_screen.dart';
import 'package:wall_e/source/register/register_navigation_page.dart';
import 'package:wall_e/source/sendMoney/pages/sendmoney_screen.dart';
import 'package:wall_e/source/sendMoney/sendmoney_navigation_page.dart';
import 'package:wall_e/source/setting/pages/settingscreen.dart';
import 'package:wall_e/source/splash_screen/splash_screen.dart';
import 'package:wall_e/source/widget/forgot_password/forgot_password_widget.dart';

import 'app_route.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings, context) {
    //print('this is route: ${settings.name}');
    switch (settings.name) {
      case AppRoute.startingRoute:
        return MaterialPageRoute(builder: ((_) => const SplashScreen()));

      case AppRoute.onboardRoute:
        return MaterialPageRoute(builder: ((_) => const OnBoardScreen()));

      case AppRoute.loginScreen:
        return MaterialPageRoute(builder: ((_) => const LoginScreen()));

      case AppRoute.signupScreen:
        return MaterialPageRoute(builder: ((_) => RegisterNavigationPage()));

      case AppRoute.forgotPassword:
        return MaterialPageRoute(builder: ((_) => const ForgotPassword()));

      case AppRoute.homeScreen:
        return MaterialPageRoute(
            builder: ((_) => const CustomBottomNavigationBarPage()));

      case AppRoute.beneficiaryScreen:
        return MaterialPageRoute(builder: ((_) => const BeneficiaryScreen()));

      case AppRoute.sendmoneyScreen:
        return MaterialPageRoute(builder: ((_) => const SendMoneyScreen()));

      case AppRoute.historyScreen:
        return MaterialPageRoute(builder: ((_) => const HistoryScreen()));

      case AppRoute.settingScreen:
        return MaterialPageRoute(builder: ((_) => const SettingScreen()));

      // case AppRoute.notificationRoute:
      //   return MaterialPageRoute(builder: ((_) => const NotificationPage()));

      case AppRoute.tranSuccessPage:
        return MaterialPageRoute(
            builder: ((_) => const TransactionSuccessPage()));

      case AppRoute.topUpPage:
        return MaterialPageRoute(builder: ((_) => const TopUpPage()));

      case AppRoute.beneficiaryDetails:
        return MaterialPageRoute(
            builder: ((_) => const BeneficiaryDetailsPage()));

      case AppRoute.beneficiaryNavigationRoute:
        return MaterialPageRoute(builder: ((_) => BeneficiaryNavigationPage()));

      case AppRoute.sendmoneyNavigationRoute:
        return MaterialPageRoute(builder: ((_) => SendMoneyNavigationPage()));

      // case AppRoute.kycNavigationRoute:
      //   return MaterialPageRoute(builder: ((_) => KycNavigationPage()));

      case AppRoute.topuppaymentPage:
        return MaterialPageRoute(builder: ((_) => const TopupPaymentPage()));

      // case AppRoute.changePasswordRoute:
      //   return MaterialPageRoute(builder: ((_) => const ChangePasswordPage()));

      default:
        return MaterialPageRoute(builder: ((_) => const Placeholder()));
    }
  }
}
