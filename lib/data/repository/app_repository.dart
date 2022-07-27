import 'dart:io';
import 'package:flutter/foundation.dart' show kDebugMode;

import 'package:path_provider/path_provider.dart';

import '/utility/constants.dart';
import '/data/model/data_model.dart';
import '/data/provider/app_api.dart';

class Repository {
  final AppApi api;
  const Repository({required this.api});

  Future<List<DataModel>?> getData() async {
    var directory = await getTemporaryDirectory();
    File dataFile = File("${directory.path}/$fileName");
    if (dataFile.existsSync()) {
      if (kDebugMode) {
        print("dataComingFromCache");
      }
      final data = dataFile.readAsStringSync();
      final dataModel = dataModelFromJson(data);
      return dataModel;
    } else {
      try {
        final rawData = await api.getRawData();
        if (rawData.statusCode >= 200 && rawData.statusCode <= 399) {
          dataFile.writeAsStringSync(rawData.body, flush: true, mode: FileMode.write);
          return dataModelFromJson(rawData.body);
        } else {
          return null;
        }
      } on HttpException catch (_) {
        rethrow;
      } on SocketException catch (_) {
        rethrow;
      } on Exception {
        rethrow;
      }
    }
  }
}
