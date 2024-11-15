// ignore_for_file: unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'my_login_states.dart';

class MyLoginCubit extends Cubit<MyLoginStates> {
  MyLoginCubit() : super(MyLoginInitiaLState());
  Future<void> myLoginMethod({
    required String loginEmaiL,
    required String loginPassword,
  }) async {
    emit(MyLoginLoadingState());
    try {
      UserCredential userLogin =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: loginEmaiL,
        password: loginPassword,
      );
      emit(MyLoginSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(
          MyLoginFaiLureState(
            errorMessage: "No User Found For That EmaiL.",
          ),
        );
      } else if (e.code == 'wrong-password') {
        emit(
          MyLoginFaiLureState(
            errorMessage: "Wrong Password Provided For That User.",
          ),
        );
      }
    } catch (ex) {
      emit(
        MyLoginFaiLureState(
          errorMessage: "SomeThing Went Wrong.",
        ),
      );
    }
  }
}
