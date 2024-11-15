part of 'my_auth_bloc.dart';

@immutable
sealed class MyAuthStates {}

final class MyAuthInitiaLState extends MyAuthStates {}

final class MyAuthLoginLoadingState extends MyAuthStates {}

final class MyAuthLoginSuccessState extends MyAuthStates {}

final class MyAuthLoginFaiLureState extends MyAuthStates {
  final String errorMessage;

  MyAuthLoginFaiLureState({
    required this.errorMessage,
  });
}

final class MyAuthRegisterLoadingState extends MyAuthStates {}

final class MyAuthRegisterSuccessState extends MyAuthStates {}

final class MyAuthRegisterFaiLureState extends MyAuthStates {
  final String errorMessage;

  MyAuthRegisterFaiLureState({
    required this.errorMessage,
  });
}
