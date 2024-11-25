
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries/bloc/bloc_event.dart';
import 'package:groceries/bloc/bloc_state.dart';
import 'package:groceries/models/user_model.dart';
import 'package:groceries/services/auth_service.dart';

class AuthBloc extends Bloc<BlocEvent,BlocState> {

  AuthService authService;

  AuthBloc(this.authService) : super(INITIAL()){
    on<LoginUserEvent>((event,emit) => _loginUser(event, emit));
    on<RegisterUserEvent>((event,emit) => _registerUser(event, emit));
    on<ResetUserPasswordEvent>((event,emit) => _resetPassword(event, emit));
    on<CreateUserAccountEvent>((event,emit) => _createUserAccount(event, emit));
    on<DeleteUserAccountEvent>((event,emit) => _deleteUser(event, emit));
    on<GetUserInfoEvent>((event,emit) => _getUserInfo(event, emit));
  }


  _loginUser(LoginUserEvent event,Emitter<BlocState> emit) async {
    try {
      emit(LOADING());
      UserCredential? userCredentials = await authService.login(event.emailAddress, event.password);
      emit(LoginUserState(userCredentials));
    } catch(e){
      emit(ERROR(e.toString()));
    }
  }

  _registerUser(RegisterUserEvent event,Emitter<BlocState> emit) async {
    try {
      emit(LOADING());
      UserCredential? userCredential = await authService.createAccount(event.emailAddress, event.password);
      emit(RegisterUserState(userCredential));
    } catch(e){
      emit(ERROR(e.toString()));
    }
  }

  _createUserAccount(CreateUserAccountEvent event,Emitter<BlocState> emit) async {
    try {
      emit(LOADING());
      bool isDone = await authService.uploadUserInfo(event.fullName,
          event.email, event.phone, event.address);
      emit(CreateUserAccountState(isDone));
    } catch(e){
      emit(ERROR(e.toString()));
    }
  }
  
  _resetPassword(ResetUserPasswordEvent event,Emitter<BlocState> emit) async {
    try {
      emit(LOADING());
      bool isSent = await authService.resetPassword(event.email);
      emit(ResetUserPasswordState(isSent));
    } catch(e){
      emit(ERROR(e.toString()));
    }
  }

  _deleteUser(DeleteUserAccountEvent event,Emitter<BlocState> emit) async {
    try {
      bool isDeleted = await authService.deleteUserAccount();
      emit(DeleteUserAccountState(isDeleted));
    } catch(e){
      emit(ERROR(e.toString()));
    }
  }


  _getUserInfo(GetUserInfoEvent event,Emitter<BlocState> emit) async {
    try {
      UserModel? data = await authService.getUserInfo();
      emit(GetUserInfoState(data));
    } catch(e){
      emit(ERROR(e.toString()));
    }
  }


}