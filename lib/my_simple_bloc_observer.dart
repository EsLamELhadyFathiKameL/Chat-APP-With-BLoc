import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MySimpLeBLocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    debugPrint("Change = $change");
  }

  @override
  void onClose(BlocBase bloc) {
    debugPrint("CLose = $bloc");
  }

  @override
  void onCreate(BlocBase bloc) {
    debugPrint("Create = $bloc");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {}

  @override
  void onEvent(Bloc bloc, Object? event) {}

  @override
  void onTransition(Bloc bloc, Transition transition) {
    debugPrint("onTransition = $transition");
  }
}
