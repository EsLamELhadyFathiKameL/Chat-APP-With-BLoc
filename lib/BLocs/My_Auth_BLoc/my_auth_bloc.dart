// ignore_for_file: unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'my_auth_events.dart';
part 'my_auth_states.dart';

class MyAuthBLoc extends Bloc<MyAuthEvents, MyAuthStates> {
  MyAuthBLoc() : super(MyAuthInitiaLState()) {
    on<MyAuthEvents>(
      (event, emit) async {
        if (event is MyLoginEvent) {
          emit(MyAuthLoginLoadingState());
          try {
            UserCredential userLogin =
                await FirebaseAuth.instance.signInWithEmailAndPassword(
              email: event.loginEmaiL,
              password: event.loginPassword,
            );
            emit(MyAuthLoginSuccessState());
          } on FirebaseAuthException catch (e) {
            if (e.code == 'user-not-found') {
              emit(
                MyAuthLoginFaiLureState(
                  errorMessage: "No User Found For That EmaiL.",
                ),
              );
            } else if (e.code == 'wrong-password') {
              emit(
                MyAuthLoginFaiLureState(
                  errorMessage: "Wrong Password Provided For That User.",
                ),
              );
            }
          } catch (ex) {
            emit(
              MyAuthLoginFaiLureState(
                errorMessage: "SomeThing Went Wrong.",
              ),
            );
          }
        } else if (event is MyRegisterEvent) {
          emit(MyAuthRegisterLoadingState());
          try {
            UserCredential userRegistration =
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: event.registrationEmaiL,
              password: event.registrationPassword,
            );
            emit(MyAuthRegisterSuccessState());
          } on FirebaseAuthException catch (e) {
            if (e.code == 'weak-password') {
              emit(
                MyAuthRegisterFaiLureState(
                  errorMessage: "The Password Provided Is Too Weak.",
                ),
              );
            } else if (e.code == 'email-already-in-use') {
              emit(
                MyAuthRegisterFaiLureState(
                  errorMessage: "The Account ALready Exists For That EmaiL.",
                ),
              );
            }
          } catch (ex) {
            emit(
              MyAuthRegisterFaiLureState(
                errorMessage: "SomeThing Went Wrong.",
              ),
            );
          }
        }
      },
    );
  }
}
