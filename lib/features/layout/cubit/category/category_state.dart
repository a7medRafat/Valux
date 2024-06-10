part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class GetCategoriesLoadingStates extends CategoryState {}

class GetCategoriesSuccessStates extends CategoryState {
  final CategoriesModel categoriesModel;

  GetCategoriesSuccessStates({required this.categoriesModel});
}

class GetCategoriesErrorStates extends CategoryState {
  final String error;

  GetCategoriesErrorStates({required this.error});
}

class AppChangeCategoryStates extends CategoryState{}
