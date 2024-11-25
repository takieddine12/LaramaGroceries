

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries/bloc/bloc_event.dart';
import 'package:groceries/models/grocery_model.dart';
import 'package:groceries/models/user_model.dart';

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
class DeleteUserAccountState extends BlocState {
  bool isDeleted;
  DeleteUserAccountState(this.isDeleted);
}
class GetUserInfoState extends BlocState {
  UserModel? userModel;
  GetUserInfoState(this.userModel);
}


// GROCERIES
class AddGroceryState extends BlocState {

  bool isAdded;
  AddGroceryState(this.isAdded);


}
class GetGroceriesState extends BlocState {

  List<GroceryModel> list;
  GetGroceriesState(this.list);

}
