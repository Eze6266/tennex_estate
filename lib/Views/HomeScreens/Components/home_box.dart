import 'package:flutter/material.dart';
import 'package:tennex_estate/Utilities/Functions/add_comma_tostring_number.dart';
import 'package:tennex_estate/Utilities/app_colors.dart';
import 'package:tennex_estate/Utilities/reusables.dart';
import 'package:tennex_estate/Views/HomeScreens/Components/reusables.dart';
import 'package:tennex_estate/Views/HomeScreens/details_page.dart';

class HomeBox extends StatefulWidget {
  HomeBox({
    super.key,
    required this.amount,
    required this.img,
    required this.txt,
    required this.type,
    required this.location,
  });
  String txt, amount, img, type, location;

  @override
  State<HomeBox> createState() => _HomeBoxState();
}

class _HomeBoxState extends State<HomeBox> {
  bool fav = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        goTo(
          context,
          DetailsPage(
            img: widget.img,
            txt: widget.txt,
            location: widget.location,
            amount: widget.amount,
          ),
        );
      },
      child: Material(
        elevation: 0.2,
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            Container(
              height: hp(30),
              width: wp(46),
              decoration: BoxDecoration(
                color: kColors.whiteColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: wp(2),
                      vertical: hp(1),
                    ),
                    height: hp(20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: kColors.blackColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        topLeft: Radius.circular(12),
                      ),
                      image: DecorationImage(
                        image: AssetImage(widget.img),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            widget.type == '0'
                                ? SizedBox.shrink()
                                : Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: wp(1),
                                      vertical: hp(0.4),
                                    ),
                                    decoration: BoxDecoration(
                                      color: kColors.whiteColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.person,
                                          size: 18,
                                        ),
                                        Width(w: 0.2),
                                        RTxt(
                                          text: '1 Pair Waiting',
                                          size: 12,
                                          weight: FontWeight.w500,
                                          color: kColors.blackColor,
                                        ),
                                      ],
                                    ),
                                  ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  fav = !fav;
                                });
                              },
                              child: CircleAvatar(
                                backgroundColor:
                                    fav ? kColors.red : kColors.textGrey,
                                radius: 13,
                                child: Icon(
                                  Icons.favorite,
                                  color: fav
                                      ? kColors.whiteColor
                                      : kColors.whiteColor,
                                  size: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: wp(2)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RTxt(
                          text: widget.txt,
                          weight: FontWeight.w600,
                          maxLine: 1,
                          textalign: TextAlign.left,
                          color: kColors.blackColor,
                        ),
                        RTxt(
                          text: 'N${formatNumberWithCommas(widget.amount)}',
                          weight: FontWeight.w700,
                          maxLine: 1,
                          size: 15,
                          textalign: TextAlign.left,
                          color: kColors.darkGreenColor,
                        ),
                        Height(h: 0.2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.fmd_good,
                              size: 12,
                            ),
                            Width(w: 0.5),
                            SizedBox(
                              width: wp(38),
                              child: RTxt(
                                text: widget.location,
                                weight: FontWeight.w400,
                                maxLine: 1,
                                size: 12,
                                textalign: TextAlign.left,
                                color: kColors.blackColor,
                              ),
                            ),
                          ],
                        ),
                        Height(h: 0.5),
                        RTxt(
                          text: 'View Details',
                          weight: FontWeight.w500,
                          maxLine: 1,
                          size: 13,
                          color: kColors.blackColor,
                          textalign: TextAlign.left,
                        ),
                        Height(h: 0.3),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterChipsRow extends StatelessWidget {
  final bool detach;
  final bool five;
  final bool onepair;
  final bool paired;
  final bool bungalow;

  final VoidCallback onDetachTap;
  final VoidCallback onFiveTap;
  final VoidCallback onOnePairTap;
  final VoidCallback onPairedTap;
  final VoidCallback onBungalowTap;

  const FilterChipsRow({
    super.key,
    required this.detach,
    required this.five,
    required this.onepair,
    required this.paired,
    required this.bungalow,
    required this.onDetachTap,
    required this.onFiveTap,
    required this.onOnePairTap,
    required this.onPairedTap,
    required this.onBungalowTap,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ChipBtn(
            txt: 'Detached',
            active: detach,
            tap: onDetachTap,
          ),
          Width(w: 2),
          ChipBtn(
            txt: 'N5M-110M',
            active: five,
            tap: onFiveTap,
          ),
          Width(w: 2),
          ChipBtn(
            txt: '1 Pair Waiting',
            active: onepair,
            tap: onOnePairTap,
          ),
          Width(w: 2),
          ChipBtn(
            txt: 'Paired',
            active: paired,
            tap: onPairedTap,
          ),
          Width(w: 2),
          ChipBtn(
            txt: 'Bungalow',
            active: bungalow,
            tap: onBungalowTap,
          ),
          Width(w: 1),
        ],
      ),
    );
  }
}
