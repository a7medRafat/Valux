import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/features/address/cubit/address_cubit.dart';
import 'package:valux/features/auth/cubit/auth_cubit.dart';
import 'package:valux/features/cart/cubit/carts_cubit.dart';
import 'package:valux/features/details/cubit/details_cubit.dart';
import 'package:valux/features/layout/cubit/layout/layout_cubit.dart';
import 'package:valux/features/order/cubit/order_cubit.dart';
import 'package:valux/features/search/cubit/search_cubit.dart';
import '../config/style/app_themes.dart';
import '../features/favourites/cubit/favourite_cubit.dart';
import '../features/layout/cubit/category/category_cubit.dart';
import '../features/layout/cubit/home/home_cubit.dart';
import '../features/onboarding/cubit/onboarding_cubit.dart';
import '../features/profile/cubit/profile_cubit.dart';
import 'injuctoin_container.dart';

class MyApp extends StatelessWidget {
  final Widget startWidget;

  const MyApp({super.key, required this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context)=>sl<OnboardingCubit>()),
        BlocProvider(create: (BuildContext context)=>sl<AuthCubit>()),
        BlocProvider(create: (BuildContext context)=>sl<LayoutCubit>()),
        BlocProvider.value(value: sl<CategoryCubit>()..getCategories()),
        BlocProvider(create: (BuildContext context)=>sl<HomeCubit>()..getHomeData()),
        BlocProvider(create: (BuildContext context)=>sl<DetailsCubit>()),
        BlocProvider(create: (BuildContext context)=>sl<FavouriteCubit>()..getFavourites()),
        BlocProvider(create: (BuildContext context)=>sl<SearchCubit>()),
        BlocProvider(create: (BuildContext context)=>sl<CartsCubit>()..getCarts()),
        BlocProvider(create: (BuildContext context)=>sl<ProfileCubit>()),
        BlocProvider(create: (BuildContext context)=>sl<AddressCubit>()..getAddress()),
        BlocProvider(create: (BuildContext context)=>sl<OrderCubit>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: appTheme(),
            home: startWidget
        ),
      ),
    );
  }
}
