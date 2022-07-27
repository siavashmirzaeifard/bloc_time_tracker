import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '/presentation/widget/daily_widget.dart';
import '/presentation/widget/monthly_widget.dart';
import '/presentation/widget/weekly_widget.dart';
import '/logic/theme_bloc/theme_bloc.dart';
import '/utility/constants.dart';
import '/utility/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late bool isDark;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    isDark = true;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.watch<ThemeBloc>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 16.0,
            ) +
            const EdgeInsets.only(top: 32.0),
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: isDark ? darkBlueColor : const Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: Alignment.bottomCenter,
                    height: MediaQuery.of(context).size.height * 0.225,
                    child: TabBar(
                      padding: const EdgeInsets.only(bottom: 16),
                      indicatorColor: Colors.transparent,
                      controller: _tabController,
                      labelColor: isDark ? Colors.white : Colors.blueAccent,
                      unselectedLabelColor: isDark ? blueTextColor : veryDarkBlueColor,
                      tabs: [
                        Text(
                          "Daily",
                          style: GoogleFonts.rubik(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "Weekly",
                          style: GoogleFonts.rubik(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          "Monthly",
                          style: GoogleFonts.rubik(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    decoration: BoxDecoration(
                      color: isDark ? appBarBlueColor : const Color(0xFF4F57EE),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          radius: 32,
                          backgroundColor: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Image.asset("./assets/images/image-jeremy.png"),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Report for",
                              style: GoogleFonts.rubik(
                                fontWeight: FontWeight.w500,
                                color: blueTextColor,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "Jeremy Robson",
                              style: GoogleFonts.rubik(
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    //daily
                    DailyWidget(
                      titleIndex: 0,
                      textColor: isDark ? Colors.white : Colors.black,
                      cardBackgroundColor: isDark ? darkBlueColor : const Color(0xFFEEEEEE),
                      previousTextColor: isDark ? blueTextColor : veryDarkBlueColor,
                    ),

                    //weekly
                    WeeklyWidget(
                      titleIndex: 1,
                      textColor: isDark ? Colors.white : Colors.black,
                      cardBackgroundColor: isDark ? darkBlueColor : const Color(0xFFEEEEEE),
                      previousTextColor: isDark ? blueTextColor : veryDarkBlueColor,
                    ),

                    //monthly
                    MonthlyWidget(
                      titleIndex: 2,
                      textColor: isDark ? Colors.white : Colors.black,
                      cardBackgroundColor: isDark ? darkBlueColor : const Color(0xFFEEEEEE),
                      previousTextColor: isDark ? blueTextColor : veryDarkBlueColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          isDark = !isDark;
          if (isDark) {
            theme.add(ThemeEventChanged(theme: AppTheme.values[1]));
          } else {
            theme.add(ThemeEventChanged(theme: AppTheme.values[0]));
          }
        },
        backgroundColor: workColor,
        child: Icon(
          isDark ? Icons.sunny : Icons.nightlight,
          color: isDark ? Colors.yellowAccent : Colors.indigo[900],
        ),
      ),
    );
  }
}
