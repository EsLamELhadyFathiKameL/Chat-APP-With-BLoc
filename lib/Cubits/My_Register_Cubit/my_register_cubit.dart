// ignore_for_file: unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'my_register_states.dart';

class MyRegisterCubit extends Cubit<MyRegisterStates> {
  MyRegisterCubit() : super(MyRegisterInitiaLState());
  Future<void> myRegistrationMethod({
    required String registrationEmaiL,
    required String registrationPassword,
  }) async {
    emit(MyRegisterLoadingState());
    try {
      UserCredential userRegistration =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: registrationEmaiL,
        password: registrationPassword,
      );
      emit(MyRegisterSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(
          MyRegisterFaiLureState(
            errorMessage: "The Password Provided Is Too Weak.",
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        emit(
          MyRegisterFaiLureState(
            errorMessage: "The Account ALready Exists For That EmaiL.",
          ),
        );
      }
    } catch (ex) {
      emit(
        MyRegisterFaiLureState(
          errorMessage: "SomeThing Went Wrong.",
        ),
      );
    }
  }
}
