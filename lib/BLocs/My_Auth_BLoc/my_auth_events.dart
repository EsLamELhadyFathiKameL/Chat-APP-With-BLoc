part of 'my_auth_bloc.dart';

@immutable
sealed class MyAuthEvents {}

class MyLoginEvent extends MyAuthEvents {
  final String loginEmaiL;
  final String loginPassword;

  MyLoginEvent({
    required this.loginEmaiL,
    required this.loginPassword,
  });
}

class MyRegisterEvent extends MyAuthEvents {
  final String registrationEmaiL;
  final String registrationPassword;

  MyRegisterEvent({
    required this.registrationEmaiL,
    required this.registrationPassword,
  });
}
