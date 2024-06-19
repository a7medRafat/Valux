import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/core/functions/app_functions.dart';
import 'app/injuctoin_container.dart' as di;
import 'App/bloc_observer.dart';
import 'App/myapp.dart';
import 'core/dio_helper/dio_helper.dart';
import 'core/local_storage/user_storage.dart';
import 'core/shared_preferances/cache_helper.dart';
import 'features/profile/data/models/GetProfileModel.dart';
import 'package:hive_flutter/adapters.dart';
import 'App/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(ProfileDataAdapter());
  await UserData().init();
  await di.init();
  DioHelper.init();
  await CacheHelper.init();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  Widget widget = AppFunctions.startWidget();

  runApp(MyApp(startWidget: widget));
}
