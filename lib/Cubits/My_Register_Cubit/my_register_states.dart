part of 'my_register_cubit.dart';

@immutable
sealed class MyRegisterStates {}

final class MyRegisterInitiaLState extends MyRegisterStates {}

final class MyRegisterLoadingState extends MyRegisterStates {}

final class MyRegisterSuccessState extends MyRegisterStates {}

final class MyRegisterFaiLureState extends MyRegisterStates {
  final String errorMessage;

  MyRegisterFaiLureState({
    required this.errorMessage,
  });
}
