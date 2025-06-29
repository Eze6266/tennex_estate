import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tennex_estate/Utilities/app_colors.dart';
import 'package:tennex_estate/Utilities/image_constants.dart';
import 'package:tennex_estate/Utilities/reusables.dart';
import 'package:tennex_estate/Views/bottom_nav.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _dropController;
  late AnimationController _exitController;
  late Animation<double> _dropAnimation;
  late Animation<Offset> _slideOutAnimation;
  late Animation<double> _fadeOutAnimation;

  bool showLogo = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});
    _dropController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _dropAnimation = Tween<double>(begin: -200, end: 0).animate(
      CurvedAnimation(
        parent: _dropController,
        curve: Curves.bounceOut,
      ),
    );

    _exitController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _slideOutAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0, 2), // Slide down
    ).animate(CurvedAnimation(parent: _exitController, curve: Curves.easeIn));

    _fadeOutAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _exitController, curve: Curves.easeIn));

    // Start drop animation
    _dropController.forward();

    // After 3s, slide out and fade
    Future.delayed(Duration(seconds: 4), () {
      _exitController.forward();
    });

    // After total 4s, navigate
    Future.delayed(Duration(seconds: 5), () {
      goTo(context, BottomNav(chosenmyIndex: 0));
    });
  }

  @override
  void dispose() {
    _dropController.dispose();
    _exitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    SizeConfig.init(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColors.whiteColor,
        toolbarHeight: 0.001,
      ),
      backgroundColor: kColors.whiteColor,
      body: AnimatedBuilder(
        animation: Listenable.merge([_dropController, _exitController]),
        builder: (context, child) {
          return Stack(
            children: [
              Positioned(
                top: _dropAnimation.value + size.height * 0.4,
                left: size.width * 0.34,
                child: SlideTransition(
                  position: _slideOutAnimation,
                  child: FadeTransition(
                    opacity: _fadeOutAnimation,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        kImages.appLogo,
                        height: hp(16),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
