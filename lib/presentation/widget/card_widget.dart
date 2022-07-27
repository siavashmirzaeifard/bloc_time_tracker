import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '/utility/constants.dart';

class CardWidget extends StatelessWidget {
  final String imageAddress;
  final Color cardColor;
  final String cardTitle;
  final String cardTime;
  final String previousTime;
  final String periodTitle;
  final Color textColor;
  final Color previousTextColor;
  final Color cardBackgroundColor;

  const CardWidget(
      {Key? key,
      required this.imageAddress,
      required this.cardColor,
      required this.cardTitle,
      required this.cardTime,
      required this.previousTime,
      required this.periodTitle,
      required this.textColor,
      required this.cardBackgroundColor,
      required this.previousTextColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 5,
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 16,
            top: -12,
            child: SvgPicture.asset(
              imageAddress,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.all(16),
              height: MediaQuery.of(context).size.height / 7,
              decoration: BoxDecoration(
                color: cardBackgroundColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        cardTitle,
                        style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w500,
                          color: textColor,
                          fontSize: 18,
                        ),
                      ),
                      SvgPicture.asset(
                        "./assets/images/icon-ellipsis.svg",
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${cardTime}hrs",
                        style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w300,
                          color: textColor,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        "$periodTitle - ${previousTime}hrs",
                        style: GoogleFonts.rubik(
                          fontWeight: FontWeight.w400,
                          color: previousTextColor,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
