// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:wall_e/core/color/theme_color.dart';
import 'package:wall_e/core/icons/app_icons.dart';

class QrScanPage extends StatefulWidget {
  const QrScanPage({super.key});

  @override
  State<QrScanPage> createState() => _QrScanPageState();
}

class _QrScanPageState extends State<QrScanPage> {
  int activeState = 0;
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Row(
                  children: [
                    Icon(AppIcon.arrowBack),
                    Text(
                      'Back',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'QR Code Scan',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 300,
                    color: ThemeAppColors.light,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    'Align the QR Code within the frame to scan and confirm to proceed the payment',
                    style: TextStyle(color: ThemeAppColors.silver),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(
                      'assets/images/qr_image.jpg',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('My QR Code'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
