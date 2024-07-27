import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:valux/features/search/data/models/SearchModel.dart';
import '../domain/usecases/search_usecase.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchUseCase searchUseCase;

  SearchCubit({required this.searchUseCase}) : super(SearchInitial());

  SearchModel? searchModel;

  void search({required String text}) async {
    emit(SearchLoadingState());
    final failureOrSuccess = await searchUseCase.call(text: text);
    failureOrSuccess
        .fold((failure) => emit(SearchErrorState(error: failure.getMessage())),
            (success) {
      searchModel = success;
      emit(SearchSuccessState(model: success));
    });
  }
}
