

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groceries/bloc/bloc_event.dart';
import 'package:groceries/bloc/bloc_state.dart';

class GroceryBloc extends Bloc<BlocEvent,BlocState> {

  GroceryBloc() : super(INITIAL());

}