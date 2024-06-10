part of 'favourite_cubit.dart';

@immutable
abstract class FavouriteState {}

class FavouriteInitial extends FavouriteState {}

class GetFavouritesLoadingSate extends FavouriteState {}

class GetFavouritesSuccessSate extends FavouriteState {
  final FavModel favModel;

  GetFavouritesSuccessSate({required this.favModel});
}

class GetFavouritesErrorSate extends FavouriteState {
  final String error;

  GetFavouritesErrorSate({required this.error});
}
