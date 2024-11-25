
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:groceries/models/grocery_model.dart';

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

  Future<List<GroceryModel>> getGroceries() async {
    try {
      DataSnapshot dataSnapshot = await _firebaseDatabase.ref().child("Groceries").get();

      if (dataSnapshot.exists) {
        List<GroceryModel> groceries = [];

        for (var child in dataSnapshot.children) {
          Map<String, dynamic> groceryData = Map<String, dynamic>.from(child.value as Map);
          groceries.add(GroceryModel.fromJson(groceryData));
        }

        return groceries;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }

  }
}