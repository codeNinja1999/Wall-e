// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:wall_e/core/color/theme_color.dart';
import 'package:wall_e/core/icons/app_icons.dart';
import 'package:wall_e/source/config/pop_config.dart';
import 'package:wall_e/source/wall_e/login_screen/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      extendBody: true,
      backgroundColor: theme.backgroundColor,
      body: WillPopScope(
        onWillPop: () => PopApp.popApp(context),
        child: SafeArea(
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
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: theme.primaryColorLight,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 420,
                          child: ListView.separated(
                            separatorBuilder: (context, index) => Divider(
                              indent: 10,
                              thickness: 1,
                              endIndent: 80,
                            ),
                            itemCount: profileSetting.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Icon(
                                  settingIcons[index],
                                  color: ThemeAppColors.primaryBlue,
                                ),
                                title: Text(
                                  profileSetting[index],
                                  style: TextStyle(fontSize: 14),
                                ),
                                trailing: IconButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Will open setting'),
                                      ),
                                    );
                                  },
                                  icon: Icon(AppIcon.arrowForward),
                                ),
                              );
                            },
                          ),
                        ),
                        Divider(
                          indent: 10,
                          endIndent: 80,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
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

                  //my voucher promo

                  //settings

                  //redeem gift

                  //change password

                  //help

                  //logout
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List<String> profileSetting = [
  'Account Information',
  'My Voucher Promo',
  'Settings',
  'Redeem Gift',
  'Change Password',
  'Help'
];
List<IconData> settingIcons = [
  AppIcon.person,
  AppIcon.voucherPromo,
  AppIcon.setting,
  AppIcon.gift,
  AppIcon.password,
  AppIcon.help
];
