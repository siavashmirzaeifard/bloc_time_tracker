import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '/logic/app_bloc/app_bloc.dart';
import '/logic/app_bloc/app_state.dart';
import '/utility/constants.dart';
import 'card_widget.dart';

class DailyWidget extends StatelessWidget {
  final int titleIndex;
  final Color textColor;
  final Color previousTextColor;
  final Color cardBackgroundColor;

  const DailyWidget(
      {Key? key,
      required this.titleIndex,
      required this.textColor,
      required this.cardBackgroundColor,
      required this.previousTextColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = context.watch<AppBloc>().state.data;

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      itemCount: data?.length ?? 0,
      itemBuilder: (context, index) {
        return Column(
          children: [
            CardWidget(
              imageAddress: iconArray[index],
              cardColor: colorArray[index],
              cardTitle: data?[index].title ?? "",
              cardTime: data?[index].timeframes.daily.current.toString() ?? "",
              previousTime: data?[index].timeframes.daily.previous.toString() ?? "",
              periodTitle: previousTitleArray[titleIndex],
              textColor: textColor,
              cardBackgroundColor: cardBackgroundColor,
              previousTextColor: previousTextColor,
            ),
            const SizedBox(height: 24),
          ],
        );
      },
    );
  }
}
