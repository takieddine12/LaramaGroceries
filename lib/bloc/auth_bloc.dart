
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries/bloc/bloc_event.dart';
import 'package:groceries/bloc/bloc_state.dart';
import 'package:groceries/services/auth_service.dart';

class AuthBloc extends Bloc<BlocEvent,BlocState> {

  AuthService authService;

  AuthBloc(this.authService) : super(INITIAL()){
    on<LoginUserEvent>((event,emit) => loginUser(event, emit));
    on<RegisterUserEvent>((event,emit) => registerUser(event, emit));
    on<ResetUserPasswordEvent>((event,emit) => resetPassword(event, emit));
  }


  loginUser(LoginUserEvent event,Emitter<BlocState> emit) async {
    try {
      emit(LOADING());
      UserCredential? userCredentials = await authService.login(event.emailAddress, event.password);
      emit(LoginUserState(userCredentials));
    } catch(e){
      emit(ERROR(e.toString()));
    }
  }

  registerUser(RegisterUserEvent event,Emitter<BlocState> emit) async {
    try {
      emit(LOADING());
      UserCredential? userCredential = await authService.createAccount(event.emailAddress, event.password);
      emit(RegisterUserState(userCredential));
    } catch(e){
      emit(ERROR(e.toString()));
    }
  }
  
  resetPassword(ResetUserPasswordEvent event,Emitter<BlocState> emit) async {
    try {
      emit(LOADING());
      bool isSent = await authService.resetPassword(event.email);
      emit(ResetUserPasswordState(isSent));
    } catch(e){
      emit(ERROR(e.toString()));
    }
  }

  deleteUser(DeleteUserAccountEvent event,Emitter<BlocState> emit) async {
    try {
      bool isDeleted = await authService.deleteUserAccount();
      emit(DeleteUserAccountState(isDeleted));
    } catch(e){
      emit(ERROR(e.toString()));
    }
  }



}