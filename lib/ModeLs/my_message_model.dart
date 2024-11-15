import 'package:my_chat_app/my_constants.dart';

class MyMessageModeL {
  final String myMessage;
  final String myMessageID;

  MyMessageModeL({
    required this.myMessage,
    required this.myMessageID,
  });
  factory MyMessageModeL.fromJson(json) {
    return MyMessageModeL(
      myMessage: json[kMessageKey],
      myMessageID: json[kMessageID],
    );
  }
}
