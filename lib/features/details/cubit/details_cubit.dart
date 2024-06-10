import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:valux/features/cart/cubit/carts_cubit.dart';
import 'package:valux/features/cart/data/models/AddToCartModel.dart';
import '../../../App/injuctoin_container.dart';
import '../domain/usecases/add_delete_to_cart_usecase.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final AddDeleteToCartUseCase addDeleteToCartUseCase;

  DetailsCubit({required this.addDeleteToCartUseCase})
      : super(DetailsInitial());

  bool isExpanded = false;
  int selectedImg = -1;
  Map<int, bool> inCart = {};

  void changeExpanded() {
    isExpanded = !isExpanded;
    emit(AppChangeExpandedState());
  }

  void changeSelectedImg(int index) {
    selectedImg = index;
    emit(AppChangeSelectedImgStates());
  }

  void addDeleteToCart({required int productId}) async {
    emit(AddDeleteToCartLoadingState());
    inCart[productId] = !inCart[productId]!;
    final failureOrSuccess =
        await addDeleteToCartUseCase.call(productId: productId);
    failureOrSuccess.fold((failure) {
      inCart[productId] = !inCart[productId]!;
      emit(AddDeleteToCartErrorState(error: failure.getMessage()));
    }, (success) {
      if (success.status == false) {
        inCart[productId] = !inCart[productId]!;
      }
      sl<CartsCubit>().getCarts();
      emit(AddDeleteToCartSuccessState(model: success));
    });
  }
}
