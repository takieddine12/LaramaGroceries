

import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

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

  Future<bool> deleteUserAccount() async {
     try {
       await _firebaseAuth.currentUser?.delete();
       return true;
     } catch(e){
       return false;
     }
  }

}