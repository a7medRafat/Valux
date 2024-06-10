part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchSuccessState extends SearchState {
  final SearchModel model;

  SearchSuccessState({required this.model});
}

class SearchErrorState extends SearchState {
  final String error;

  SearchErrorState({required this.error});
}
