

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries/bloc/bloc_event.dart';
import 'package:groceries/bloc/bloc_state.dart';
import 'package:groceries/services/groceries_service.dart';

class GroceryBloc extends Bloc<BlocEvent,BlocState> {

  GroceriesService groceriesService;
  GroceryBloc(this.groceriesService) : super(INITIAL()){
    on<AddGroceriesEvent>((event,emit) => _addGrocery(event, emit));
  }

  _addGrocery(AddGroceriesEvent event , Emitter<BlocState> emit) async {
    try {
      emit(AddGroceryState(await groceriesService.addGrocery(
          event.name, event.price, event.description, event.nutritionValue)));
    } catch(e){
      emit(ERROR(e.toString()));
    }
  }

}