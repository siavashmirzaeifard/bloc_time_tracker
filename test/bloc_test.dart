import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

import 'package:bloc_test/bloc_test.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'package:time_tracker_app/data/model/data_model.dart';
import 'package:time_tracker_app/logic/app_bloc/app_bloc.dart';
import 'package:time_tracker_app/logic/app_bloc/app_event.dart';
import 'package:time_tracker_app/logic/app_bloc/app_state.dart';

final mockedData = [
  DataModel(
    timeframes: Timeframes(
      daily: Daily(
        current: 10,
        previous: 11,
      ),
      monthly: Monthly(
        current: 20,
        previous: 21,
      ),
      weekly: Weekly(
        current: 30,
        previous: 31,
      ),
    ),
    title: "Work",
  )
];

const String kTemporaryPath = 'temporaryPath';
const String kApplicationSupportPath = 'applicationSupportPath';
const String kDownloadsPath = 'downloadsPath';
const String kLibraryPath = 'libraryPath';
const String kApplicationDocumentsPath = 'applicationDocumentsPath';
const String kExternalCachePath = 'externalCachePath';
const String kExternalStoragePath = 'externalStoragePath';

class MockPathProviderPlatform extends Fake
    with MockPlatformInterfaceMixin
    implements PathProviderPlatform {
  @override
  Future<String?> getTemporaryPath() async {
    return kTemporaryPath;
  }
}

class NullMockPathProviderPlatform extends Fake
    with MockPlatformInterfaceMixin
    implements PathProviderPlatform {
  @override
  Future<String?> getTemporaryPath() async {
    return null;
  }
}

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  group("Testing BLoC", () {
    late AppBloc bloc;

    setUp(() {
      bloc = AppBloc();
    });

    blocTest<AppBloc, AppState>(
      "Test initial state",
      build: () => bloc,
      verify: (bloc) => expect(
        bloc.state,
        const AppStateInitialize(isLoading: false),
      ),
    );

    blocTest<AppBloc, AppState>(
      "Loading data from the API",
      build: () => bloc,
      act: (bloc) async {
        PathProviderPlatform.instance = MockPathProviderPlatform();
        bloc.add(const AppEventInitialize());
      },
      expect: () => [const AppStateLoading(isLoading: true)],
    );

    blocTest<AppBloc, AppState>(
      "Loading data from the API",
      build: () => bloc,
      act: (bloc) async {
        PathProviderPlatform.instance = MockPathProviderPlatform();
        bloc.add(const AppEventInitialize());
      },
      expect: () => [const AppStateLoading(isLoading: false)],
    );
  });

  group('PathProvider implementation', () {
    setUp(() async {
      PathProviderPlatform.instance = MockPathProviderPlatform();
    });

    test('Get temporary directory', () async {
      final Directory result = await getTemporaryDirectory();
      expect(result.path, kTemporaryPath);
    });
  });

  group('PathProvider null implementation', () {
    setUp(() async {
      PathProviderPlatform.instance = NullMockPathProviderPlatform();
    });

    test('Get temporary directory throws on null', () async {
      expect(getTemporaryDirectory(), throwsA(isA<MissingPlatformDirectoryException>()));
    });
  });
}
