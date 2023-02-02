// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wall_e/core/color/theme_color.dart';
import 'package:wall_e/source/login/login_screen.dart';
import 'package:wall_e/source/resources/image_extension.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int currentIndex = 0;
  final pages = [
    ImageExtension.page1,
    ImageExtension.page2,
    ImageExtension.page3
  ];
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 350,
              child: PageView.builder(
                controller: pageController,
                itemCount: pages.length,
                itemBuilder: (context, index) {
                  return Image.asset(pages[index]);
                },
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
              ),
            ),

            //smooth indicator
            SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: WormEffect(dotHeight: 8, dotWidth: 8),
            ),
            // Spacer(flex: 1),
            SizedBox(height: 80),

            //Easy to use
            Text(
              'Easy to use',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 25),

            //description
            Text(
              'Get ready to pay all your bills with just a few taps. Paying your bills became fast and efficient. Enjoy!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, color: Colors.grey.shade400),
            ),
            SizedBox(height: 75),

            //button
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  minimumSize: Size(double.infinity, 60),
                  backgroundColor: ThemeAppColors.primaryBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
              child: Text(
                'Get Started',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
