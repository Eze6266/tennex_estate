// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tennex_estate/Utilities/app_colors.dart';
import 'package:tennex_estate/Utilities/image_constants.dart';
import 'package:tennex_estate/Utilities/reusables.dart';
import 'package:tennex_estate/Views/HomeScreens/home_screen.dart';

class BottomNav extends StatefulWidget {
  BottomNav({super.key, required this.chosenmyIndex});
  final int chosenmyIndex;

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  late int myIndex;
  bool isLoggedIn = false;
  DateTime currentTime = DateTime.now();
  List<Widget> widgetList = [
    HomeScreen(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
  ];

  @override
  void initState() {
    super.initState();
    myIndex = widget.chosenmyIndex;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async {
        final difference = DateTime.now().difference(currentTime);
        final isExitWarning = difference >= Duration(seconds: 2);
        currentTime = DateTime.now();
        if (isExitWarning) {
          final message = 'Press back again to exit';
          Fluttertoast.showToast(msg: message, fontSize: 14);
          return false;
        } else {
          SystemChannels.platform.invokeMethod('SystemNavigator.pop');
          return Future.value(false);
        }
      },
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          height: hp(7),
          width: 95 * size.width / 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: kColors.primaryColor,
                spreadRadius: -2,
                blurRadius: 5,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BottomNavigationBar(
              selectedLabelStyle: TextStyle(
                color: kColors.primaryColor,
                fontFamily: 'Rany',
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              selectedItemColor: kColors.blackColor,
              unselectedItemColor: kColors.textGrey.withOpacity(0.8),
              unselectedLabelStyle: TextStyle(
                color: kColors.textGrey,
                fontFamily: 'Rany',
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              type: BottomNavigationBarType.fixed,
              backgroundColor:
                  kColors.whiteColor, // Background color of the navigation bar
              showSelectedLabels: true,
              showUnselectedLabels: true,
              onTap: (index) {
                setState(() {
                  myIndex = index;
                });
              },
              currentIndex: myIndex,
              items: [
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    kImages.homeicon,
                    color: kColors.blackColor,
                    height: 2.9 * size.height / 100,
                    width: 3 * size.width / 100,
                  ),
                  label: 'Home',
                  icon: SvgPicture.asset(
                    kImages.homeicon,
                    color: kColors.textGrey,
                    height: 2.9 * size.height / 100,
                    width: 3 * size.width / 100,
                  ),
                ),
                BottomNavigationBarItem(
                  activeIcon: Icon(
                    Icons.people_alt,
                    color: kColors.blackColor,
                    size: 24,
                  ),
                  label: 'Pairing',
                  icon: Icon(
                    Icons.people_alt,
                    color: kColors.textGrey.withOpacity(0.8),
                    size: 24,
                  ),
                ),
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    kImages.chaticon,
                    color: kColors.blackColor,
                    height: 3 * size.height / 100,
                    width: 3 * size.width / 100,
                  ),
                  label: 'Chat',
                  icon: SvgPicture.asset(
                    kImages.chaticon,
                    color: kColors.textGrey.withOpacity(0.8),
                    height: 3 * size.height / 100,
                    width: 3 * size.width / 100,
                  ),
                ),
                BottomNavigationBarItem(
                  activeIcon: SvgPicture.asset(
                    kImages.settingsicon,
                    color: kColors.blackColor,
                    height: 2.9 * size.height / 100,
                    width: 3 * size.width / 100,
                  ),
                  label: 'Settings',
                  icon: SvgPicture.asset(
                    kImages.settingsicon,
                    color: kColors.textGrey.withOpacity(0.8),
                    height: 2.9 * size.height / 100,
                    width: 3 * size.width / 100,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: widgetList[myIndex],
      ),
    );
  }
}
