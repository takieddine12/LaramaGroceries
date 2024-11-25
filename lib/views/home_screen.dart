import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:groceries/bloc/auth_bloc.dart';
import 'package:groceries/bloc/bloc_state.dart';
import 'package:groceries/extras/routes.dart';
import 'package:groceries/models/grocery_model.dart';
import 'package:groceries/models/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc,BlocState>(
      listener: (context,state){

        if(state is GetUserInfoState){
           setState(() {
             userModel = state.userModel;
           });
        }

      },
      child: SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              Get.toNamed(Routes.add);
            },
            child: Icon(Icons.add,size: 25,color: Colors.white,),
          ),
          body: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome"),
                  Text(userModel!.fullName)
                ],
              ),
              Divider(),
              BlocBuilder(
                builder: (context,state){
                  if(state is LOADING){
                    return Center(
                      child: SpinKitCubeGrid(size: 50,color: Colors.black),
                    );
                  }
                  else if (state is ERROR){
                    return Center(
                      child: SpinKitCubeGrid(size: 50,color: Colors.black),
                    );
                  }
                  else if (state is GetGroceriesState){
                    List<GroceryModel> list = state.list;
                    return GridView.builder(
                       itemCount: list.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context,index){
                           return Card(
                             child: Column(
                               children: [
                                 Image.asset("assets/images/fig.png",height: 120,),
                                 Text(list[index].name),
                                 Text(list[index].price.toString())
                               ],
                             ),
                           );
                        });
                  }
                  return Center(
                    child: SpinKitCubeGrid(size: 50,color: Colors.black),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
