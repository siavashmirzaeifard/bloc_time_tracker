import 'package:flutter/material.dart';

Color workColor = const Color(0xFFFF8C66);
Color playColor = const Color(0xFF56C2E6);
Color studyColor = const Color(0xFFFF5C7C);
Color exerciseColor = const Color(0xFF4ACF81);
Color socialColor = const Color(0xFF7536D3);
Color selfCareColor = const Color(0xFFF1C65B);
Color veryDarkBlueColor = const Color(0xFF0F1424);
Color darkBlueColor = const Color(0xFF1C1F4A);
Color appBarBlueColor = const Color(0xFF6F76C8);
Color blueTextColor = const Color(0xFFBDC1FF);

const String baseURL = "https://wookie.codesubmit.io/time-tracking";

final colorArray = [
  workColor,
  playColor,
  studyColor,
  exerciseColor,
  socialColor,
  selfCareColor,
];

final iconArray = [
  "./assets/images/icon-work.svg",
  "./assets/images/icon-play.svg",
  "./assets/images/icon-study.svg",
  "./assets/images/icon-exercise.svg",
  "./assets/images/icon-social.svg",
  "./assets/images/icon-self-care.svg",
];

final previousTitleArray = ["Yesterday", "Last Week", "Last Month"];

const String fileName = "dataModel.json";
