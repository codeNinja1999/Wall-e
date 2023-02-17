import 'package:wall_e/core/app_size/app_size.dart';
import 'package:wall_e/core/router/app_route.dart';
import 'package:flutter/material.dart';
import 'package:wall_e/core/color/theme_color.dart';
import 'package:wall_e/core/icons/app_icons.dart';
import 'package:wall_e/source/ui/login/login_screen.dart';
import 'package:wall_e/source/widget/exit_app_widget/exit_app_widget.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return WillPopScope(
      onWillPop: () => PopApp.popApp(context),
      child: Scaffold(
        extendBody: true,
        backgroundColor: theme.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppSize.viewMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 50,
                    backgroundImage: AssetImage(
                      'assets/images/profile1.png',
                    ),
                  ),
                  //stephanie poetri
                  Text(
                    'Stephanie Poetri',
                    style: theme.textTheme.titleMedium,
                  ),

                  //stephaniepoetri@gmail.com
                  Text(
                    'stephaniepoetri@gmail.com',
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: ThemeAppColors.silver),
                  ),

                  //+6278****4523
                  Text(
                    '+6278****4523',
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(color: ThemeAppColors.silver),
                  ),

                  //account information
                  const SizedBox(height: 20),

                  Container(
                    height: 500,
                    padding: const EdgeInsets.only(
                      left: AppSize.cornerRadiusMedium,
                      right: AppSize.cornerRadiusMedium,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.inset),
                      color: theme.primaryColorLight,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 420,
                          child: ListView(
                            children:
                                ListTile.divideTiles(context: context, tiles: [
                              SettingCard(
                                  data: 'Account Information',
                                  icon: AppIcon.person,
                                  onPressed: () {}),
                              SettingCard(
                                  data: 'My Voucher Promo',
                                  icon: AppIcon.voucherPromo,
                                  onPressed: () {}),
                              SettingCard(
                                  data: 'Settings',
                                  icon: AppIcon.setting,
                                  onPressed: () {}),
                              SettingCard(
                                data: 'Redeem Gift',
                                icon: AppIcon.gift,
                                onPressed: () {},
                              ),
                              SettingCard(
                                data: 'Change Password',
                                icon: AppIcon.password,
                                onPressed: () => Navigator.pushNamed(
                                    context, AppRoute.changePasswordRoute),
                              ),
                              SettingCard(
                                  data: 'Help',
                                  icon: AppIcon.help,
                                  onPressed: () {}),
                            ]).toList(),
                          ),
                        ),
                        const SizedBox(height: AppSize.viewSpacing),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                AppIcon.logout,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Logout',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SettingCard extends StatelessWidget {
  const SettingCard(
      {super.key, required this.data, required this.icon, this.onPressed});

  final String data;
  final IconData icon;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: AppSize.inset),
      child: ListTile(
        leading: Icon(
          icon,
          color: theme.primaryColor,
        ),
        title: Text(
          data,
          style: theme.textTheme.labelLarge,
        ),
        trailing: IconButton(
          onPressed: onPressed,
          icon: const Icon(AppIcon.arrowForward),
        ),
      ),
    );
  }
}
