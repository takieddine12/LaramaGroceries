

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BlocEvent extends Equatable {

}

// AUTH EVENTS

class LoginUserEvent extends BlocEvent {
  final String emailAddress;
  final String password;

  LoginUserEvent(this.emailAddress,this.password);

  @override
  List<Object?> get props => [emailAddress,password];

}

class RegisterUserEvent extends BlocEvent {
  final String emailAddress;
  final String password;

  RegisterUserEvent(this.emailAddress,this.password);

  @override
  List<Object?> get props => [emailAddress,password];

}


class CreateUserAccountEvent extends BlocEvent {

  final String fullName;
  final String email;
  final String phone;
  final String address;

  CreateUserAccountEvent(this.fullName,this.email,this.phone,this.address);

  @override
  List<Object?> get props => [fullName,email,phone,address];

}

class ResetUserPasswordEvent extends BlocEvent {
  final String email;
  ResetUserPasswordEvent(this.email);

  @override
  List<Object?> get props => [email];


}

// GROCERY EVENTS