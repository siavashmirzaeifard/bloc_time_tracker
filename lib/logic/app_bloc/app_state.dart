import 'package:flutter/foundation.dart' show immutable;

import 'package:equatable/equatable.dart';

import '/data/model/data_model.dart';

abstract class AppState extends Equatable {
  final bool isLoading;
  const AppState({required this.isLoading});
}

@immutable
class AppStateInitialize extends AppState {
  final List<DataModel>? data;
  const AppStateInitialize({
    required bool isLoading,
    this.data,
  }) : super(isLoading: isLoading);

  @override
  List<Object?> get props => [
        isLoading,
        data,
      ];
}

@immutable
class AppStateLoading extends AppState {
  const AppStateLoading({required bool isLoading}) : super(isLoading: isLoading);

  @override
  List<Object?> get props => [];
}

extension GetData on AppState {
  List<DataModel>? get data {
    final cls = this;
    if (cls is AppStateInitialize) {
      return cls.data;
    } else {
      return null;
    }
  }
}
