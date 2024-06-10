import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:valux/features/favourites/data/models/FavModel.dart';
import 'package:valux/features/layout/cubit/category/category_cubit.dart';
import 'package:valux/features/layout/data/models/HomeModel.dart';
import 'package:valux/features/layout/data/models/ProductsModel.dart';
import 'package:valux/features/layout/domain/usecases/add_delete_fav_usecase.dart';
import 'package:valux/features/layout/domain/usecases/get_category_products_usecase.dart';
import '../../../../App/injuctoin_container.dart';
import '../../../favourites/cubit/favourite_cubit.dart';
import '../../domain/usecases/get_home_date_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetHomeDataUseCase getHomeDataUseCase;
  final GetCategoryProductUseCase categoryProductUseCase;
  final AddDeleteFavUseCase addDeleteFavUseCase;

  HomeCubit({
    required this.getHomeDataUseCase,
    required this.categoryProductUseCase,
    required this.addDeleteFavUseCase,
  }) : super(HomeInitial());

  HomeModel? homeModel;
  Map<int, bool> favourites = {};
  ProductModel? productsModel;

  void getHomeData() async {
    emit(GetHomeDataLoadingStates());
    final failureOrSuccess = await getHomeDataUseCase.call();
    failureOrSuccess.fold(
        (failure) => emit(GetHomeDataErrorStates(error: failure.getMessage())),
        (success) {
      homeModel = success;
      emit(GetHomeDataSuccessStates(homeModel: success));
    });
  }


  void getCategoryProducts({required categoryId}) async {
    emit(GetProductsLoadingStates());
    final failureOrSuccess =
        await categoryProductUseCase.call(categoryId: categoryId);
    failureOrSuccess.fold(
        (failure) => emit(GetProductsErrorStates(error: failure.getMessage())),
        (success) {
      productsModel = success;
      emit(GetProductsSuccessStates(productModel: success));
    });
  }

  void addDeleteFav({required int productId}) async {
    emit(AddDeleteToFavLoadingState());
    favourites[productId] = !favourites[productId]!;
    final failureOrSuccess =
        await addDeleteFavUseCase.call(productId: productId);
    failureOrSuccess.fold((failure) {
      favourites[productId] = !favourites[productId]!;
      emit(AddDeleteToFavErrorState(error: failure.getMessage()));
    }, (success) {
      if (success.status == false) {
        favourites[productId] = !favourites[productId]!;
      }
      sl<FavouriteCubit>().getFavourites();
      emit(AddDeleteToFavSuccessState(model: success));
    });
  }

  Products? getOneProduct({required int id}) {
    for (var e in homeModel!.data!.products!) {
      if (e.id == id) {
        Products oneProduct = e;
        return oneProduct;
      }
    }
    return null;
  }

  IconData like(int index) {
    if (sl<CategoryCubit>().selectedCategory == -1) {
      return favourites[homeModel!.data!.products![index].id]!
          ? Icons.favorite
          : CupertinoIcons.heart;
    } else {
      return favourites[productsModel!.data!.data![index].id]!
          ? Icons.favorite
          : CupertinoIcons.heart;
    }
  }

}
