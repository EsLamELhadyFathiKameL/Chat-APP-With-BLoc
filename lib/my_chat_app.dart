import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_chat_app/BLocs/My_Auth_BLoc/my_auth_bloc.dart';
import 'package:my_chat_app/Cubits/My_Auth_Cubit/my_auth_cubit.dart';
import 'package:my_chat_app/Cubits/My_Chat_Cubit/my_chat_cubit.dart';
import 'package:my_chat_app/Cubits/My_Login_Cubit/my_login_cubit.dart';
import 'package:my_chat_app/Cubits/My_Register_Cubit/my_register_cubit.dart';
import 'package:my_chat_app/Screens/my_chat_page.dart';
import 'package:my_chat_app/Screens/my_login_page.dart';
import 'package:my_chat_app/Screens/my_register_page.dart';
import 'package:my_chat_app/firebase_options.dart';
import 'package:my_chat_app/my_constants.dart';
import 'package:my_chat_app/my_simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MySimpLeBLocObserver();
  runApp(const MyChatAPP());
}

class MyChatAPP extends StatelessWidget {
  const MyChatAPP({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MyLoginCubit(),
        ),
        BlocProvider(
          create: (context) => MyRegisterCubit(),
        ),
        BlocProvider(
          create: (context) => MyAuthCubit(),
        ),
        BlocProvider(
          create: (context) => MyChatCubit(),
        ),
        BlocProvider(
          create: (context) => MyAuthBLoc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          kLoginPage: (context) => const MyLoginPage(),
          kRegisterPage: (context) => const MyRegisterPage(),
          kChatPage: (context) => const MyChatPage(),
        },
        initialRoute: kLoginPage,
      ),
    );
  }
}
