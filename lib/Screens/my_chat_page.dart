import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_chat_app/Cubits/My_Chat_Cubit/my_chat_cubit.dart';
import 'package:my_chat_app/ModeLs/my_message_model.dart';
import 'package:my_chat_app/Widgets/my_chat_buble.dart';
import 'package:my_chat_app/Widgets/my_friend_chat_buble.dart';
import 'package:my_chat_app/my_constants.dart';

class MyChatPage extends StatefulWidget {
  const MyChatPage({super.key});
  static String id = kChatPage;

  @override
  State<MyChatPage> createState() => _MyChatPageState();
}

class _MyChatPageState extends State<MyChatPage> {
  TextEditingController textFieldController = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    String loginEmaiL = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryCoLor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            MdiIcons.arrowLeft,
            color: Colors.white,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 45),
          child: Row(
            children: [
              Image.asset(
                kLogo,
                height: 45,
              ),
              const Text(
                "Chat",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontFamily: "Pacifico",
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<MyChatCubit, MyChatStates>(
              listener: (context, state) {},
              builder: (context, state) {
                List<MyMessageModeL> myMessagesList =
                    BlocProvider.of<MyChatCubit>(context).myMessagesList;
                return ListView.builder(
                  reverse: true,
                  controller: scrollController,
                  physics: const BouncingScrollPhysics(),
                  itemCount: myMessagesList.length,
                  itemBuilder: (context, index) {
                    return myMessagesList[index].myMessageID == loginEmaiL
                        ? MyChatBubLe(
                            myMessage: myMessagesList[index],
                          )
                        : MyFriendChatBubLe(
                            myMessage: myMessagesList[index],
                          );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 8,
              bottom: 16,
            ),
            child: TextField(
              controller: textFieldController,
              onSubmitted: (value) {
                BlocProvider.of<MyChatCubit>(context).mySendMessageMethod(
                    myMessage: value, loginEmaiL: loginEmaiL);
                textFieldController.clear();
                scrollController.animateTo(
                  0,
                  duration: const Duration(seconds: 5),
                  curve: Curves.easeIn,
                );
              },
              style: TextStyle(
                fontSize: 12,
                color: kPrimaryCoLor,
              ),
              cursorColor: kPrimaryCoLor,
              decoration: InputDecoration(
                suffixIcon: Icon(
                  MdiIcons.send,
                  color: kPrimaryCoLor,
                ),
                hintText: "Send Your Message",
                hintStyle: TextStyle(
                  fontSize: 15,
                  color: kPrimaryCoLor,
                  fontFamily: "Pacifico",
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: kPrimaryCoLor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                    color: kPrimaryCoLor,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
