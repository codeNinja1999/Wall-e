import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wall_e/core/router/app_route.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _navigate();
    super.initState();
  }

  _navigate() async {
    await Future.delayed(const Duration(seconds: 2)).then(
      (value) => Navigator.pushReplacementNamed(context, AppRoute.onboardRoute),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/wallpaper.jpg'),
                    fit: BoxFit.cover)),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2.5,
            left: 80,
            child: Image.asset(
              'assets/images/logo101.png',
              width: 200,
            ),
          ),
        ],
      ),
    );
  }
}
