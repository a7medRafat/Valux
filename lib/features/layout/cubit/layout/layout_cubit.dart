import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:valux/core/dio_helper/dio_helper.dart';
import 'package:valux/core/end_points/end_points.dart';
import 'package:valux/core/local_storage/hive_keys.dart';
import 'package:valux/core/local_storage/user_storage.dart';
import '../../../../core/go/go.dart';
import '../../../../core/shared_preferances/cache_helper.dart';
import '../../../auth/presentation/screen/login_screen.dart';
import '../../../cart/presentation/screens/cart_screen.dart';
import '../../../favourites/presentation/screens/fav_screen.dart';
import '../../../search/presentation/screens/search_screen.dart';
import '../../presentation/screens/home_screen.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());

  void logOut(context) async {
    emit(AppLogoutLoadingState());
    Go.goAndFinish(context, const LoginScreen());
    final res = await DioHelper.postData(
        url: EndPoints.LOGOUT,
        data: {'fcm_token': 'SomeFcmToken'},
        token: UserData().getData(id: Keys.user)!.token);
    if (res.statusCode == 200) {
      CacheHelper.removeData(key: 'token');
      CacheHelper.removeData(key: 'profile');
      UserData().deleteData(id: Keys.user);
      emit(AppLogoutSuccessState());
    }
  }

  int currentNavIndex = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void changeNavButton(int index, BuildContext context) {
    currentNavIndex = index;
    emit(AppChangeButtonNavBarStates());
  }

  List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    const FavScreen(),
    const CartScreen()
  ];
}
