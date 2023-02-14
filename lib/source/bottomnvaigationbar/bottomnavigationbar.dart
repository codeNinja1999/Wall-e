import 'package:wall_e/core/color/theme_color.dart';
import 'package:wall_e/core/icons/app_icons.dart';
import 'package:wall_e/core/router/app_route.dart';
import 'package:wall_e/source/beneficiary/pages/beneficiary_screen.dart';
import 'package:flutter/material.dart';
import 'package:wall_e/source/history/pages/historyscreen.dart';
import 'package:wall_e/source/home/pages/homescreen.dart';
import 'package:wall_e/source/setting/pages/settingscreen.dart';

class CustomBottomNavigationBarPage extends StatefulWidget {
  const CustomBottomNavigationBarPage({super.key});

  @override
  State<CustomBottomNavigationBarPage> createState() =>
      _CustomBottomNavigationBarPageState();
}

class _CustomBottomNavigationBarPageState
    extends State<CustomBottomNavigationBarPage> {
  final pageController = PageController();
  int _selectedIndex = 0;
  final List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(icon: Icon(AppIcon.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(AppIcon.person), label: 'Receiver'),
    BottomNavigationBarItem(icon: Icon(AppIcon.accessTime), label: 'History'),
    BottomNavigationBarItem(icon: Icon(AppIcon.setting), label: 'Setting'),
  ];

  final List<Widget> _screen = [
    const HomeScreen(),
    const BeneficiaryScreen(),
    const HistoryScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: false,
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: Visibility(
      //   visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
      //   child: FloatingActionButton(
      //     onPressed: () =>
      //         Navigator.pushNamed(context, AppRoute.sendmoneyScreen),
      //     child: Icon(
      //       AppIcon.sendMoney,
      //       color: ThemeAppColors.light,
      //     ),
      //   ),
      // ),
      bottomNavigationBar: Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          // color: Colors.red,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(blurRadius: 10, color: Colors.black26),
          ],
        ),
        child: BottomAppBar(
          // color: Colors.amber,

          clipBehavior: Clip.antiAlias,
          shape: const CircularNotchedRectangle(),
          notchMargin: 4,
          child: BottomNavigationBar(
            elevation: 0,
            currentIndex: _selectedIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: ThemeAppColors.primaryBlue,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            onTap: (value) {
              setState(() {
                _selectedIndex = value;
              });
              //pageController.jumpToPage(value);
            },
            items: items,
          ),
        ),
      ),
      body: _screen[_selectedIndex],
    );
  }
}
