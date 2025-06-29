// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:tennex_estate/Utilities/reusables.dart';

class AdvertContainer extends StatelessWidget {
  AdvertContainer({
    super.key,
    required this.imgUrl,
  });

  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: wp(2)),
      child: Container(
        height: 10 * size.height / 100,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            // Background image
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(imgUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Grey overlay
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            // Text content
            Padding(
              padding: EdgeInsets.only(left: 4 * size.width / 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Height(h: 1.5),
                  kTxt(
                    text: 'Get up to',
                    size: 16,
                    color: Colors.white,
                  ),
                  kTxt(
                    text: '0.0% off',
                    size: 24,
                    weight: FontWeight.w600,
                    maxLine: 1,
                    color: Colors.white,
                  ),
                  kTxt(
                    text: 'when you hire emmanuel😉',
                    weight: FontWeight.w500,
                    size: 16,
                    textalign: TextAlign.start,
                    color: Colors.white,
                  ),
                  Height(h: 1.5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
