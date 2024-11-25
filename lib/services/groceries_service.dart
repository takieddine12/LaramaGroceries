
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class GroceriesService {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;


  Future<bool> addGrocery(String name , double price , String description ,
        String nutritionValue) async {


    try {
      var groceryID = DateTime.now().microsecondsSinceEpoch.toString();
      var grocery = {
        "name" : name,
        "price" : price,
        "description" : description,
        "nutritionValue" : nutritionValue,
        "groceryID" : groceryID
      };
      await _firebaseDatabase.ref().child("Groceries").child(groceryID).set(grocery);
      return true;
    } catch(e){
      return false;
    }

  }

}