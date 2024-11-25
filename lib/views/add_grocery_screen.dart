import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:groceries/bloc/bloc_event.dart';
import 'package:groceries/bloc/bloc_state.dart';
import 'package:groceries/bloc/grocery_bloc.dart';
import 'package:groceries/components/custom_container.dart';
import 'package:groceries/components/grocery_edit_text.dart';
import 'package:groceries/extras/utils.dart';

class AddGroceryScreen extends StatefulWidget {
  const AddGroceryScreen({super.key});

  @override
  State<AddGroceryScreen> createState() => _AddGroceryScreenState();
}

class _AddGroceryScreenState extends State<AddGroceryScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _nutritionController = TextEditingController();
  bool isLoading = false;


  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    _nutritionController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<GroceryBloc,BlocState>(
        listener: (context,state){

          if(state is AddGroceryState){
            var isAdded = state.isAdded;
            if(isAdded){

              setState(() {
                isLoading = false;
              });

              Get.showSnackbar(GetSnackBar(
                message: "Grocery Successfully Added",
              ));

            } else {

              setState(() {
                isLoading = false;
              });

              Get.showSnackbar(GetSnackBar(
                message: "Failed to add grocery",
              ));
            }
          }

        },
        child: SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Add New Grocery",style: Utils.getBoldFont().copyWith(fontSize: 25),),
                  Divider(),
                  const SizedBox(height: 30,),
                  GroceryEditText(hint: "Name", textEditingController: _nameController, isDigit: false,),
                  const SizedBox(height: 10,),
                  GroceryEditText(hint: "Price", textEditingController: _priceController, isDigit: true,),
                  const SizedBox(height: 10,),
                  GroceryEditText(hint: "Description", textEditingController: _descriptionController, isDigit: false,),
                  const SizedBox(height: 10,),
                  GroceryEditText(hint: "Nutrition Value", textEditingController: _nutritionController, isDigit: false,),
                  const SizedBox(height: 50,),
                  Center(
                    child: CustomContainer(text: "Add Grocery", onClick: (){

                      var name = _nameController.text;
                      var price = _priceController.text;
                      var description = _descriptionController.text;
                      var nutritionValue = _nutritionController.text;

                      if(name.isEmpty){
                        Get.showSnackbar(GetSnackBar(
                          title: "Name",
                          message: "Name cannot be empty",
                        ));
                        return;
                      }
                      if(price.isEmpty){
                        Get.showSnackbar(GetSnackBar(
                          title: "Price",
                          message: "Price cannot be empty",
                        ));
                        return;
                      }
                      if(description.isEmpty){
                        Get.showSnackbar(GetSnackBar(
                          title: "Description",
                          message: "Description cannot be empty",
                        ));
                        return;
                      }
                      if(nutritionValue.isEmpty){
                        Get.showSnackbar(GetSnackBar(
                          title: "Nutrition Value",
                          message: "Nutrition Value cannot be empty",
                        ));
                        return;
                      }

                      setState(() {
                        isLoading = true;
                      });

                      BlocProvider.of<GroceryBloc>(context).add(AddGroceriesEvent(
                          name, double.parse(price), description, nutritionValue));

                    }, isLoading: isLoading),
                  )
                ],
              ),
            ),
          ),
        ),);
  }
}
