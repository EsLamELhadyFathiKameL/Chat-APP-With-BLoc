import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:my_chat_app/ModeLs/my_message_model.dart';
import 'package:my_chat_app/my_constants.dart';

part 'my_chat_states.dart';

class MyChatCubit extends Cubit<MyChatStates> {
  MyChatCubit() : super(MyChatInitiaLState());
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCoLLections);
  List<MyMessageModeL> myMessagesList = [];
  void mySendMessageMethod({
    required String myMessage,
    required String loginEmaiL,
  }) {
    messages.add({
      kMessageKey: myMessage,
      kMessageTime: DateTime.now(),
      kMessageID: loginEmaiL,
    });
  }

  void myGetMessagesMethod() {
    messages.orderBy(kMessageTime, descending: true).snapshots().listen(
      (event) {
        myMessagesList.clear();
        for (var doc in event.docs) {
          myMessagesList.add(MyMessageModeL.fromJson(doc));
        }
        emit(
          MyChatSuccessState(),
        );
      },
    );
  }
}
