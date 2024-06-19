import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'generic_states.dart';

class GenericCubit<T> extends Cubit<GenericState<T>> {
  GenericCubit() : super(InitialState<T>());

  GenericCubit get(context) => BlocProvider.of(context);

  void customEmit(GenericState<T> state) {
    emit(state);
  }
}
