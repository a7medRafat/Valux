import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:valux/features/favourites/data/models/FavModel.dart';
import '../domain/usecases/get_fav_usecase.dart';
part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit({required this.getFavUseCase}) : super(FavouriteInitial());
  final GetFavUseCase getFavUseCase;

  void getFavourites() async {
    emit(GetFavouritesLoadingSate());
    final failureOrSuccess = await getFavUseCase.call();
    failureOrSuccess.fold(
        (failure) => emit(GetFavouritesErrorSate(error: failure.getMessage())),
        (success) {
      emit(GetFavouritesSuccessSate(favModel: success));
    });
  }
}
