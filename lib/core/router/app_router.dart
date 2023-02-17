import 'package:flutter/material.dart';
import 'package:wall_e/source/ui/beneficiary/beneficiary_navigation_page.dart';
import 'package:wall_e/source/ui/beneficiary/pages/beneficiary_screen.dart';
import 'package:wall_e/source/ui/beneficiary/pages/beneficiary_details_page.dart';
import 'package:wall_e/source/ui/bottomnvaigationbar/bottomnavigationbar.dart';
import 'package:wall_e/source/ui/forgot_password/pages/otp_verification_page.dart';
import 'package:wall_e/source/ui/forgot_password/pages/password_change_success_page.dart';
import 'package:wall_e/source/ui/forgot_password/pages/reset_password_page.dart';
import 'package:wall_e/source/ui/history/pages/historyscreen.dart';
import 'package:wall_e/source/ui/history/pages/all_transaction_list_page.dart';
import 'package:wall_e/source/ui/home/features/topup/topup_page.dart';
import 'package:wall_e/source/ui/home/features/topup/topup_payment_page.dart';
import 'package:wall_e/source/ui/home/features/topup/transaction_success_page.dart';
import 'package:wall_e/source/ui/login/login_screen.dart';
import 'package:wall_e/source/ui/onboard_screen/onboard_screen.dart';
import 'package:wall_e/source/ui/register/register_navigation_page.dart';
import 'package:wall_e/source/ui/sendMoney/pages/sendmoney_screen.dart';
import 'package:wall_e/source/ui/sendMoney/sendmoney_navigation_page.dart';
import 'package:wall_e/source/ui/setting/change_password/change_password_page.dart';
import 'package:wall_e/source/ui/setting/pages/settingscreen.dart';
import 'package:wall_e/source/ui/splash_screen/splash_screen.dart';
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
        return MaterialPageRoute(builder: ((_) => const ResetPasswordPage()));

      case AppRoute.resetPasswordSuccess:
        return MaterialPageRoute(
            builder: ((_) => const PasswordChangeSuccess()));

      case AppRoute.verifyOtpRoute:
        return MaterialPageRoute(builder: ((_) => const VerifyOtpPage()));

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
            builder: (_) => const TransactionSuccessPage());

      case AppRoute.topUpPage:
        return MaterialPageRoute(builder: (_) => const TopUpPage());

      case AppRoute.beneficiaryDetails:
        return MaterialPageRoute(
            builder: (_) => const BeneficiaryDetailsPage());

      case AppRoute.beneficiaryNavigationRoute:
        return MaterialPageRoute(builder: (_) => BeneficiaryNavigationPage());

      case AppRoute.sendmoneyNavigationRoute:
        return MaterialPageRoute(builder: (_) => SendMoneyNavigationPage());

      // case AppRoute.kycNavigationRoute:
      //   return MaterialPageRoute(builder: ((_) => KycNavigationPage()));

      case AppRoute.topuppaymentPage:
        return MaterialPageRoute(builder: (_) => const TopupPaymentPage());

      case AppRoute.allTranscationListRoute:
        return MaterialPageRoute(
            builder: (_) => const AllTransactionListPage());

      case AppRoute.changePasswordRoute:
        return MaterialPageRoute(builder: ((_) => const ChangePasswordPage()));

      default:
        return MaterialPageRoute(builder: (_) => const Placeholder());
    }
  }
}
