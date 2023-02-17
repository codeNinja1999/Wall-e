import 'package:flutter/material.dart';
import 'package:wall_e/core/router/app_router.dart';
import 'package:provider/provider.dart';
import 'package:wall_e/core/theme/theme_config.dart';
import 'package:wall_e/core/theme/theme_data.dart';
import 'package:wall_e/source/ui/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeConfig(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        onGenerateRoute: (setting) {
          return AppRouter.onGenerateRoute(setting, context);
        },
        home: const SplashScreen(),
      ),
    );
  }
}
