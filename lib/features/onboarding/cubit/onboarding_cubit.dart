import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../core/go/go.dart';
import '../../../core/shared_preferances/cache_helper.dart';
import '../../auth/presentation/screen/login_screen.dart';
import '../data/models/onboarding_model.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());

  static OnboardingCubit get(context) => BlocProvider.of(context);

  var onboardController = PageController();
  List<OnboardingModel> boarding = [
    OnboardingModel(
      image: 'assets/images/board_one.jpg',
      title: 'Browse For Your Favourites',
      body:
          'There are more than 1,000 brands of men and woman shoes and clothing in the catalog ',
    ),
    OnboardingModel(
      image: 'assets/images/board_two.jpg',
      title: 'Choose Your Item',
      body:
          'Just two clicks and you can buy all the fashion or others with home delivery ',
    ),
    OnboardingModel(
      image: 'assets/images/board_three.jpg',
      title: 'Pay Cash Or Even Card',
      body:
          'The order can be paid by credit card or cash at the time of the delivery ',
    ),
  ];

  bool isLast = false;

  void onPageChanged(int index) {
    if (index == boarding.length - 1) {
      isLast = true;
    } else {
      isLast = false;
    }
    print(isLast);
    emit(ChangePageIndicatorState());
  }

  void nextPage(context) {
    if (isLast == true) {
      skip(context: context);
    } else {
      onboardController.nextPage(
          duration: const Duration(milliseconds: 900),
          curve: Curves.fastEaseInToSlowEaseOut);
    }
  }

  void skip({required context}) {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        Go.goTo(context, LoginScreen());
      }
    });
  }
}
