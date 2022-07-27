import 'package:flutter/foundation.dart' show immutable;

import 'package:equatable/equatable.dart';

@immutable
abstract class AppEvent extends Equatable {
  const AppEvent();
}

@immutable
class AppEventInitialize extends AppEvent {
  const AppEventInitialize();

  @override
  List<Object?> get props => [];
}
