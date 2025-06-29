import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tennex_estate/Utilities/Functions/add_comma_tostring_number.dart';
import 'package:tennex_estate/Utilities/app_colors.dart';
import 'package:tennex_estate/Utilities/image_constants.dart';
import 'package:tennex_estate/Utilities/reusables.dart';
import 'package:tennex_estate/Views/HomeScreens/Components/home_box.dart';
import 'package:tennex_estate/Views/HomeScreens/Components/advert_box.dart';
import 'package:tennex_estate/Views/HomeScreens/Components/reusables.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    _timer?.cancel();
    pageviewController.dispose();
    super.dispose();
  }

  void startAutoScroll() {
    _timer = Timer.periodic(Duration(seconds: 4), (timer) {
      int nextPage = pageviewController.page!.toInt() + 1;
      if (nextPage >= 2) {
        nextPage = 0;
      }
      pageviewController.animateToPage(
        nextPage,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startAutoScroll();
    });
  }

  final pageviewController = PageController();
  Timer? _timer;
  bool detach = false;
  bool five = false;
  bool onepair = false;
  bool paired = false;
  bool bungalow = false;

  List txts = [
    '3 Bedroom Duplex-Lekki Phase 1',
    '4 Bedroom Terrace-Victoria Island',
    '5 Bedroom Bungalow',
    '4 Detached Apartment Building',
    '4 Bedroom Terrace-Victoria Island',
    '5 Bedroom Bungalow',
  ];
  List imgs = [
    kImages.house3,
    kImages.house4,
    kImages.houseimg,
    kImages.house2,
    kImages.house,
    kImages.house3,
  ];
  List amount = [
    '20000000',
    '45000000',
    '150000000',
    '12000000',
    '32000000',
    '32000000',
  ];
  List types = [
    '1',
    '2',
    '0',
    '1',
    '0',
    '2',
  ];
  List location = [
    'Lekki Phase 1, Lagos',
    'Victoria Island, Lagos',
    'Banana Island, Lagos',
    'Arewa Kaduna, Kaduna',
    'Umudike Portharcourt, Portharcourt',
    'Victoria Island, Abuja',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColors.greyWhite.withOpacity(0.2),
      appBar: AppBar(
        toolbarHeight: hp(5),
        backgroundColor: kColors.greyWhite.withOpacity(0.1),
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Text(
          'Hi Tennex',
          style: GoogleFonts.aBeeZee(
            textStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: kColors.blackColor,
            ),
          ),
        ),
        actions: [
          SvgPicture.asset(
            kImages.searchicon,
            height: hp(3),
          ),
          Width(w: 2),
          SvgPicture.asset(
            kImages.notificationicon,
            height: hp(2.8),
          ),
          Width(w: 2),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: wp(3)),
                child: Column(
                  children: [
                    Height(h: 1),
                    FilterChipsRow(
                      detach: detach,
                      five: five,
                      onepair: onepair,
                      paired: paired,
                      bungalow: bungalow,
                      onDetachTap: () {
                        setState(() => detach = !detach);
                      },
                      onFiveTap: () {
                        setState(() => five = !five);
                      },
                      onOnePairTap: () {
                        setState(() => onepair = !onepair);
                      },
                      onPairedTap: () {
                        setState(() => paired = !paired);
                      },
                      onBungalowTap: () {
                        setState(() => bungalow = !bungalow);
                      },
                    ),
                    Height(h: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RTxt(
                          text: 'Popular',
                          color: kColors.blackColor,
                          size: 17,
                          weight: FontWeight.w600,
                        ),
                        RTxt(
                          text: 'View all',
                          color: kColors.blackColor,
                          size: 12,
                          weight: FontWeight.w600,
                        ),
                      ],
                    ),
                    Height(h: 0.6),
                    SizedBox(
                      height: hp(31),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: txts.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(right: wp(2.3)),
                            child: HomeBox(
                              txt: txts[index],
                              img: imgs[index],
                              amount: amount[index],
                              type: types[index],
                              location: location[index],
                            ),
                          );
                        },
                      ),
                    ),
                    Height(h: 2),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        height: hp(12),
                        width: wp(93),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: PageView(
                          controller: pageviewController,
                          children: [
                            AdvertContainer(imgUrl: kImages.house),
                            AdvertContainer(imgUrl: kImages.house3),
                          ],
                        ),
                      ),
                    ),
                    Height(h: 1.5),
                    SmoothPageIndicator(
                      effect: ExpandingDotsEffect(
                        dotColor: kColors.textGrey.withOpacity(0.4),
                        activeDotColor: kColors.primaryColor,
                        dotHeight: hp(0.8),
                        dotWidth: wp(1.8),
                        expansionFactor:
                            4.5, // Controls how much the active dot expands
                        spacing: wp(1),
                      ),
                      controller: pageviewController,
                      count: 2, // Update with actual count
                    ),
                    Height(h: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RTxt(
                          text: 'Bungalows',
                          color: kColors.blackColor,
                          size: 17,
                          weight: FontWeight.w600,
                        ),
                        RTxt(
                          text: 'View all',
                          color: kColors.blackColor,
                          size: 12,
                          weight: FontWeight.w600,
                        ),
                      ],
                    ),
                    Height(h: 0.6),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: EdgeInsets.only(
            left: wp(2.8),
            right: wp(2.8),
            bottom: hp(10),
          ),
          child: GridView.builder(
            itemCount: txts.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: wp(2.3),
              crossAxisSpacing: wp(2.3),
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) {
              return HomeBox(
                txt: txts[index],
                img: imgs[index],
                amount: amount[index],
                type: types[index],
                location: location[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
