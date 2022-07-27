import 'package:bloc/bloc.dart';

import 'app_event.dart';
import 'app_state.dart';
import '/data/repository/app_repository.dart';
import '/data/provider/app_api.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc()
      : super(const AppStateInitialize(
          isLoading: false,
          data: null,
        )) {
    on<AppEventInitialize>((event, emit) async {
      emit(const AppStateLoading(isLoading: true));
      final repository = Repository(api: AppApi());
      final result = await repository.getData();
      if (result == null) {
        return;
      }
      emit(AppStateInitialize(
        isLoading: false,
        data: result,
      ));
    });
  }
}
