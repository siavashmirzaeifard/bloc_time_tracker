part of 'theme_bloc.dart';

abstract class ThemeEvent {
  const ThemeEvent();
}

class ThemeEventChanged extends ThemeEvent {
  final AppTheme theme;
  const ThemeEventChanged({required this.theme});
}
