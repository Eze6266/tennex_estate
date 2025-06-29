import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tennex_estate/Utilities/app_colors.dart';
import 'package:tennex_estate/Views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: kColors.whiteColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tennex',
        home: SplashScreen(),
      ),
    );
  }
}
