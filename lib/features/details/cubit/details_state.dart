part of 'details_cubit.dart';

@immutable
abstract class DetailsState {}

class DetailsInitial extends DetailsState {}


class AppChangeExpandedState extends DetailsState {}

class AppChangeSelectedImgStates extends DetailsState {}

class AddDeleteToCartLoadingState extends DetailsState{}

class AddDeleteToCartErrorState extends DetailsState{
  final String error;

  AddDeleteToCartErrorState({required this.error});
}

class AddDeleteToCartSuccessState extends DetailsState{
  final AddToCartModel model;

  AddDeleteToCartSuccessState({required this.model});
}
