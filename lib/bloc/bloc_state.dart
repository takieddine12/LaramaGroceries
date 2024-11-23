

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BlocState {



}
class INITIAL extends BlocState {}
class LOADING extends BlocState {}
class ERROR extends BlocState {
  final String error;
  ERROR(this.error);
}
class LoginUserState extends BlocState {
  UserCredential? userCredential;
  LoginUserState(this.userCredential);
}
class RegisterUserState extends BlocState {
  UserCredential? userCredential;
  RegisterUserState(this.userCredential);
}
class CreateUserAccountState extends BlocState {
  bool result;
  CreateUserAccountState(this.result);
}
class ResetUserPasswordState extends BlocState {
  bool result;
  ResetUserPasswordState(this.result);
}

