import 'package:flutter/material.dart';
import 'package:tennex_estate/Utilities/app_colors.dart';
import 'package:tennex_estate/Utilities/reusables.dart';

class ChipBtn extends StatelessWidget {
  ChipBtn({
    super.key,
    required this.active,
    required this.tap,
    required this.txt,
  });
  bool active;
  Function() tap;
  String txt;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: wp(3),
          vertical: hp(0.8),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: active ? kColors.indicatorBlue : kColors.whitishGrey,
        ),
        child: Center(
          child: RTxt(
            text: txt,
            color: active ? kColors.whiteColor : kColors.blackColor,
            weight: FontWeight.w500,
            size: 14,
          ),
        ),
      ),
    );
  }
}

class DetailsBox extends StatefulWidget {
  DetailsBox({
    super.key,
    required this.img,
  });

  String img;

  @override
  State<DetailsBox> createState() => _DetailsBoxState();
}

class _DetailsBoxState extends State<DetailsBox> {
  bool fav = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: wp(2),
        vertical: hp(1),
      ),
      height: hp(39),
      width: wp(91),
      decoration: BoxDecoration(
        color: kColors.blackColor,
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(widget.img),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Height(h: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: wp(3),
                  vertical: hp(0.7),
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
                    Width(w: 0.5),
                    RTxt(
                      text: '1 Pair Waiting',
                      size: 13,
                      weight: FontWeight.w600,
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
                  backgroundColor: fav ? kColors.red : kColors.textGrey,
                  radius: 15,
                  child: Icon(
                    Icons.favorite,
                    color: fav ? kColors.whiteColor : kColors.whiteColor,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
