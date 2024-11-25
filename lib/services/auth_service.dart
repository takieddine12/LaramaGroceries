

import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:groceries/models/user_model.dart';

class AuthService {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;


  Future<UserCredential> login(String email , String password) async {
    return await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> createAccount(String email,String password) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<bool> resetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return true;
    } catch(e){
      return false;
    }
  }

  Future<bool> uploadUserInfo(String fullName , String email , String phone ,String address) async {
    try {
      var info = {
        "fullName" : fullName,
        "email" : email,
        "phone" : phone,
        "address" : address,
      };
      await _firebaseDatabase.ref().child("Users").child(_firebaseAuth.currentUser!.uid).set(info);
      return true;
    } catch(e){
      return false;
    }
  }

  Future<bool> deleteUserAccount() async {
     try {
       await _firebaseAuth.currentUser?.delete();
       return true;
     } catch(e){
       return false;
     }
  }

  Future<UserModel?> getUserInfo() async {
    try {

      DataSnapshot dataSnapshot = await _firebaseDatabase
          .ref()
          .child("Users")
          .child(_firebaseAuth.currentUser!.uid)
          .get();

      if (dataSnapshot.exists) {

        Map<String, dynamic> userData = Map<String, dynamic>.from(dataSnapshot.value as Map);
        return UserModel.fromJson(userData);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
