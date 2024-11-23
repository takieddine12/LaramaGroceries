
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class GroceriesService {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;


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

}