import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '/utility/constants.dart';

class AppErrorWidget extends StatelessWidget {
  final String message;
  const AppErrorWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: veryDarkBlueColor,
      body: Center(
        child: Text(
          message,
          style: GoogleFonts.rubik(
            fontWeight: FontWeight.w400,
            color: blueTextColor,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
