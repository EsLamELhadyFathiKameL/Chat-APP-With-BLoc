part of 'my_chat_cubit.dart';

@immutable
sealed class MyChatStates {}

final class MyChatInitiaLState extends MyChatStates {}

final class MyChatSuccessState extends MyChatStates {}
