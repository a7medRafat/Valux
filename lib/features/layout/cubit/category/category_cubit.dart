import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/models/CatetgoriesModel.dart';
import '../../domain/usecases/get_categories_usecase.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final GetCategoriesUseCase getCategoriesUseCase;

  CategoryCubit({required this.getCategoriesUseCase})
      : super(CategoryInitial());

  CategoriesModel? categoriesModel;

  void getCategories() async {
      emit(GetCategoriesLoadingStates());
      final failureOrSuccess = await getCategoriesUseCase.call();
      failureOrSuccess.fold(
          (failure) =>
              emit(GetCategoriesErrorStates(error: failure.getMessage())),
          (success) {
        categoriesModel = success;
        emit(GetCategoriesSuccessStates(categoriesModel: success));
      });
    }


  int selectedCategory = -1;

  void changeCategory(int index) {
    selectedCategory = index;
    emit(AppChangeCategoryStates());
  }
}
