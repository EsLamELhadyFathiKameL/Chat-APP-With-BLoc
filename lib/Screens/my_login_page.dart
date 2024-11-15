import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:my_chat_app/BLocs/My_Auth_BLoc/my_auth_bloc.dart';
import 'package:my_chat_app/Cubits/My_Chat_Cubit/my_chat_cubit.dart';
import 'package:my_chat_app/Methods/my_show_snack_bar_method.dart';
import 'package:my_chat_app/Widgets/my_container_widget.dart';
import 'package:my_chat_app/Widgets/my_form_text_field_widget.dart';
import 'package:my_chat_app/my_constants.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});
  static String id = kLoginPage;

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  String? loginEmaiL;
  String? loginPassword;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyAuthBLoc, MyAuthStates>(
      listener: (context, state) {
        if (state is MyAuthLoginFaiLureState) {
          myShowSnackBarMethod(
            context,
            state.errorMessage,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is MyAuthLoginLoadingState,
          child: Scaffold(
            backgroundColor: kPrimaryCoLor,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: kPrimaryCoLor,
              centerTitle: true,
              title: Container(
                color: Colors.white,
                child: Text(
                  "Login Page",
                  style: TextStyle(
                    fontSize: 18,
                    color: kPrimaryCoLor,
                    fontFamily: "Pacifico",
                  ),
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Center(
                child: Form(
                  key: formKey,
                  child: ListView(
                    children: [
                      Image.asset(
                        kLogo,
                        height: 100,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: const Text(
                          "SchoLar Chat",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: "Pacifico",
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontFamily: "Pacifico",
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      MyFormTextFieLdWidget(
                        onChanged: (value) {
                          loginEmaiL = value;
                        },
                        obscureText: false,
                        hintText: "EmaiL",
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      MyFormTextFieLdWidget(
                        onChanged: (value) {
                          loginPassword = value;
                        },
                        obscureText: true,
                        hintText: "Password",
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      MyContainerWidget(
                        textName: "Sign In",
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<MyAuthBLoc>(context).add(
                              MyLoginEvent(
                                loginEmaiL: loginEmaiL!,
                                loginPassword: loginPassword!,
                              ),
                            );

                            myShowSnackBarMethod(
                              context,
                              "SuccessfuLLy Login.",
                            );
                            BlocProvider.of<MyChatCubit>(context)
                                .myGetMessagesMethod();
                            Navigator.pushNamed(context, kChatPage,
                                arguments: loginEmaiL);
                          } else {}
                        },
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't Have An Account?\t",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontFamily: "Pacifico",
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, kRegisterPage);
                            },
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color(0XFFC7EDE6),
                                fontFamily: "Pacifico",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
