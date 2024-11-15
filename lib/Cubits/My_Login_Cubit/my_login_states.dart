part of 'my_login_cubit.dart';

@immutable
sealed class MyLoginStates {}

final class MyLoginInitiaLState extends MyLoginStates {}

final class MyLoginLoadingState extends MyLoginStates {}

final class MyLoginSuccessState extends MyLoginStates {}

final class MyLoginFaiLureState extends MyLoginStates {
  final String errorMessage;

  MyLoginFaiLureState({
    required this.errorMessage,
  });
}
