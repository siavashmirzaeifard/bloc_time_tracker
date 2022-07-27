import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';

import 'package:time_tracker_app/utility/app_theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeData: appThemeData[AppTheme.lightTheme]!)) {
    on<ThemeEvent>((event, emit) {
      if (event is ThemeEventChanged) {
        emit.call(ThemeState(themeData: appThemeData[event.theme]!));
      }
    });
  }
}
