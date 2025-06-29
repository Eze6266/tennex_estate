import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tennex_estate/Utilities/Functions/add_comma_tostring_number.dart';
import 'package:tennex_estate/Utilities/app_colors.dart';
import 'package:tennex_estate/Utilities/reusables.dart';
import 'package:tennex_estate/Views/HomeScreens/Components/reusables.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({
    super.key,
    required this.img,
    required this.txt,
    required this.location,
    required this.amount,
  });
  String img, txt, location, amount;
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColors.whiteColor,
      appBar: AppBar(
        shadowColor: kColors.whiteColor,
        surfaceTintColor: kColors.whiteColor,
        toolbarHeight: hp(4),
        backgroundColor: kColors.whiteColor,
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(
            top: hp(1.5),
            bottom: hp(1.5),
            left: wp(2),
          ),
          child: GestureDetector(
            onTap: () {
              goBack(context);
            },
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back_ios,
                ),
                Width(w: 26),
                RTxt(
                  text: 'Details',
                  color: kColors.blackColor,
                  size: 20,
                  weight: FontWeight.w600,
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: wp(3)),
          child: Column(
            children: [
              Height(h: 3),
              Center(child: DetailsBox(img: widget.img)),
              Height(h: 1.5),
              Align(
                alignment: Alignment.centerLeft,
                child: RTxt(
                  text: '  ${widget.txt}',
                  color: kColors.blackColor,
                  maxLine: 2,
                  textalign: TextAlign.left,
                  size: 22,
                  weight: FontWeight.w600,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Width(w: 1.5),
                  Icon(
                    Icons.fmd_good,
                    size: 20,
                  ),
                  RTxt(
                    text: ' ${widget.location}',
                    color: kColors.blackColor,
                    maxLine: 1,
                    textalign: TextAlign.left,
                    size: 16,
                    weight: FontWeight.w400,
                  ),
                ],
              ),
              Height(h: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RTxt(
                    text: '  N${formatNumberWithCommas(widget.amount)}',
                    color: kColors.blackColor,
                    maxLine: 2,
                    textalign: TextAlign.left,
                    size: 22,
                    weight: FontWeight.w600,
                  ),
                  GenBtn(
                    width: 30,
                    height: 4.5,
                    btnColor: kColors.blackColor,
                    btnText: 'Pair Up',
                    textSize: 16,
                  ),
                ],
              ),
              Height(h: 1),
              Divider(),
              Align(
                alignment: Alignment.centerLeft,
                child: RTxt(
                  text: ' About this property',
                  color: kColors.blackColor,
                  maxLine: 2,
                  textalign: TextAlign.left,
                  size: 18,
                  weight: FontWeight.w600,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: RTxt(
                  text:
                      ' Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
                  color: kColors.textGrey,
                  maxLine: 50,
                  textalign: TextAlign.left,
                  size: 14,
                  weight: FontWeight.w500,
                ),
              ),
              Height(h: 10),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: hp(1)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Material(
              elevation: 25,
              borderRadius: BorderRadius.circular(30),
              child: GenBtnWE(
                img: '',
                imgIcon: true,
                width: 36,
                height: 6,
                btnColor: Color(0xff131a2c),
                txtColor: kColors.whiteColor,
                borderRadius: 35,
                btnText: 'Map',
                textSize: 16,
                icon: Icons.map,
              ),
            ),
            Width(w: 5),
            Material(
              elevation: 25,
              borderRadius: BorderRadius.circular(30),
              child: GenBtnWE(
                img: '',
                imgIcon: true,
                width: 36,
                height: 6,
                btnColor: Color(0xff131a2c),
                txtColor: kColors.whiteColor,
                borderRadius: 35,
                btnText: 'Message',
                textSize: 16,
                icon: Icons.chat,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
