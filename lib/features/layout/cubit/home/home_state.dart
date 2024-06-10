part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class AppChangeCategoryStates extends HomeState {}

class GetHomeDataLoadingStates extends HomeState {}

class GetHomeDataSuccessStates extends HomeState {
  final HomeModel homeModel;

  GetHomeDataSuccessStates({required this.homeModel});
}

class GetHomeDataErrorStates extends HomeState {
  final String error;

  GetHomeDataErrorStates({required this.error});
}


class GetProductsLoadingStates extends HomeState {}

class GetProductsSuccessStates extends HomeState {
  final ProductModel productModel;

  GetProductsSuccessStates({required this.productModel});
}

class GetProductsErrorStates extends HomeState {
  final String error;

  GetProductsErrorStates({required this.error});
}

class AddDeleteToFavLoadingState extends HomeState {}

class AddDeleteToFavErrorState extends HomeState {
  final String error;

  AddDeleteToFavErrorState({required this.error});
}

class AddDeleteToFavSuccessState extends HomeState {
  final FavModel model;

  AddDeleteToFavSuccessState({required this.model});
}
