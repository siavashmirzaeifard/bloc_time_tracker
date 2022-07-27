import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import 'presentation/screen/home_screen.dart';
import 'presentation/widget/error_widget.dart';
import 'data/provider/app_api.dart';
import 'logic/app_bloc/app_state.dart';
import 'logic/app_bloc/app_bloc.dart';
import 'logic/app_bloc/app_event.dart';
import 'logic/theme_bloc/theme_bloc.dart';
import 'utility/app_theme.dart';
import 'utility/exception_handler.dart';

void main() {
  runApp(const TimeTracker());
}

class TimeTracker extends StatelessWidget {
  const TimeTracker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(
            create: (_) => ThemeBloc()..add(const ThemeEventChanged(theme: AppTheme.darkTheme))),
        BlocProvider<AppBloc>(create: (_) => AppBloc()..add(const AppEventInitialize())),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: state.themeData,
            home: BlocBuilder<AppBloc, AppState>(
              builder: (context, appState) {
                if (appState is AppStateInitialize) {
                  return const HomePage();
                } else if (appState is AppStateLoading) {
                  return Scaffold(
                    body: Center(
                        child: Lottie.asset(
                      "./assets/loading.json",
                      width: 100,
                    )),
                  );
                } else {
                  return Scaffold(
                    body: FutureBuilder(
                      future: AppApi().getRawData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return BlocBuilder<AppBloc, AppState>(
                            builder: (context, appState) {
                              if (appState is AppStateInitialize) {
                                return const HomePage();
                              } else if (appState is AppStateLoading) {
                                return Scaffold(
                                  body: Center(
                                      child: Lottie.asset(
                                    "./assets/loading.json",
                                    width: 100,
                                  )),
                                );
                              } else {
                                return const Scaffold(
                                  body: Center(
                                    child: Text("Error happened, please Restart the application"),
                                  ),
                                );
                              }
                            },
                          );
                        }
                        if (snapshot.hasError) {
                          if (snapshot.error is NoInternetException) {
                            NoInternetException noInternetException =
                                snapshot.error as NoInternetException;
                            return AppErrorWidget(message: noInternetException.message);
                          }
                          if (snapshot.error is NoServiceFoundException) {
                            NoServiceFoundException noServiceFoundException =
                                snapshot.error as NoServiceFoundException;
                            return AppErrorWidget(message: noServiceFoundException.message);
                          }
                          if (snapshot.error is InvalidFormatException) {
                            InvalidFormatException invalidFormatException =
                                snapshot.error as InvalidFormatException;
                            return AppErrorWidget(message: invalidFormatException.message);
                          }
                          UnknownException unknownException = snapshot.error as UnknownException;
                          return AppErrorWidget(message: unknownException.message);
                        }
                        return Scaffold(
                          body: Center(
                              child: Lottie.asset(
                            "./assets/loading.json",
                            width: 100,
                          )),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
