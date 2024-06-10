import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app/injuctoin_container.dart' as di;
import 'App/bloc_observer.dart';
import 'App/myapp.dart';
import 'core/dio_helper/dio_helper.dart';
import 'core/local_storage/user_storage.dart';
import 'core/shared_preferances/cache_helper.dart';
import 'features/auth/presentation/screen/login_screen.dart';
import 'features/layout/presentation/screens/app_layout.dart';
import 'features/onboarding/presentation/screens/onboarding_screen.dart';
import 'features/profile/data/models/GetProfileModel.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(ProfileDataAdapter());
  await UserData().init();
  await di.init();
  DioHelper.init();
  await CacheHelper.init();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  final bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  final String? token = CacheHelper.getData(key: 'token');
  final Widget widget;

  if (onBoarding == true) {
    if (token != null) {
      widget = const AppLayout();
    } else {
      widget = LoginScreen();
    }
  } else {
    widget = const OnboardingScreen();
  }
  runApp(MyApp(startWidget: widget));
}
