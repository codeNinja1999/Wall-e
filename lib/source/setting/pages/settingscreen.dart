// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:wall_e/core/app_size/app_size.dart';
import 'package:wall_e/core/router/app_route.dart';
import 'package:wall_e/source/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:wall_e/core/color/theme_color.dart';
import 'package:wall_e/core/icons/app_icons.dart';
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
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 50,
                    backgroundImage: AssetImage(
                      'assets/images/profile1.png',
                    ),
                  ),
                  //stephanie poetri
                  Text(
                    'Stephanie Poetri',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  //stephaniepoetri@gmail.com
                  Text(
                    'stephaniepoetri@gmail.com',
                    style:
                        TextStyle(color: ThemeAppColors.silver, fontSize: 14),
                  ),

                  //+6278****4523
                  Text(
                    '+6278****4523',
                    style:
                        TextStyle(color: ThemeAppColors.silver, fontSize: 14),
                  ),

                  //account information
                  SizedBox(height: 20),

                  Container(
                    height: 500,
                    padding: EdgeInsets.only(
                        left: AppSize.cornerRadiusMedium,
                        right: AppSize.cornerRadiusMedium),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
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

                        // SizedBox(
                        //   height: 420,
                        //   child: ListView.separated(
                        //     separatorBuilder: (context, index) => Divider(
                        //       indent: 10,
                        //       thickness: 1,
                        //       endIndent: 80,
                        //     ),
                        //     itemCount: profileSetting.length,
                        //     itemBuilder: (context, index) {
                        //       return ListTile(
                        //         leading: Icon(
                        //           settingIcons[index],
                        //           color: ThemeAppColors.primaryBlue,
                        //         ),
                        //         title: Text(
                        //           profileSetting[index],
                        //           style: TextStyle(fontSize: 14),
                        //         ),
                        //         trailing: IconButton(
                        //           onPressed: () {
                        //             ScaffoldMessenger.of(context).showSnackBar(
                        //               SnackBar(
                        //                 content: Text('Will open setting'),
                        //               ),
                        //             );
                        //           },
                        //           icon: Icon(AppIcon.arrowForward),
                        //         ),
                        //       );
                        //     },
                        //   ),
                        // ),

                        SizedBox(height: AppSize.viewSpacing),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
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
    return Padding(
      padding: const EdgeInsets.only(top: AppSize.inset),
      child: ListTile(
        leading: Icon(icon),
        title: Text(data),
        trailing: IconButton(
          onPressed: onPressed,
          icon: Icon(AppIcon.arrowForward),
        ),
      ),
    );
  }
}
