import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:valux/core/API/api_services.dart';
import 'package:valux/core/firebase/firestore.dart';
import 'package:valux/core/network/network_info.dart';
import 'package:valux/features/address/cubit/address_cubit.dart';
import 'package:valux/features/address/data/repositories/address_repository_impl.dart';
import 'package:valux/features/address/domain/usecases/get_addresses_usecase.dart';
import 'package:valux/features/auth/cubit/auth_cubit.dart';
import 'package:valux/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:valux/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:valux/features/auth/domain/usecases/user_login_usecase.dart';
import 'package:valux/features/auth/domain/usecases/user_register_usecase.dart';
import 'package:valux/features/cart/cubit/carts_cubit.dart';
import 'package:valux/features/cart/data/datasources/cart_remote_data_source.dart';
import 'package:valux/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:valux/features/cart/domain/usecases/get_carts_usecase.dart';
import 'package:valux/features/details/cubit/details_cubit.dart';
import 'package:valux/features/details/data/datasources/details_remote_data_source.dart';
import 'package:valux/features/details/data/repositories/details_repository_impl.dart';
import 'package:valux/features/details/domain/usecases/add_delete_to_cart_usecase.dart';
import 'package:valux/features/favourites/cubit/favourite_cubit.dart';
import 'package:valux/features/favourites/data/datasources/favourites_remote_data_source.dart';
import 'package:valux/features/favourites/data/repositories/favourites_repository_impl.dart';
import 'package:valux/features/favourites/domain/usecases/get_fav_usecase.dart';
import 'package:valux/features/layout/cubit/layout/layout_cubit.dart';
import 'package:valux/features/layout/data/datasources/layout_local_data_source.dart';
import 'package:valux/features/layout/data/datasources/layout_remote_data_source.dart';
import 'package:valux/features/layout/data/repositories/layout_repository_impl.dart';
import 'package:valux/features/layout/domain/usecases/add_delete_fav_usecase.dart';
import 'package:valux/features/layout/domain/usecases/get_categories_usecase.dart';
import 'package:valux/features/layout/domain/usecases/get_category_products_usecase.dart';
import 'package:valux/features/layout/domain/usecases/get_home_date_usecase.dart';
import 'package:valux/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:valux/features/order/cubit/order_cubit.dart';
import 'package:valux/features/order/data/datasources/order_remote_data_source.dart';
import 'package:valux/features/order/data/repositories/order_repository_impl.dart';
import 'package:valux/features/order/domain/repositories/order_repository.dart';
import 'package:valux/features/order/domain/usecases/get_my_orders_usecase.dart';
import 'package:valux/features/order/domain/usecases/make_order_usecase.dart';
import 'package:valux/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:valux/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:valux/features/profile/domain/usecases/change_pass_usecase.dart';
import 'package:valux/features/profile/domain/usecases/get_profile_data_usecase.dart';
import 'package:valux/features/profile/domain/usecases/update_user_usecase.dart';
import 'package:valux/features/search/cubit/search_cubit.dart';
import 'package:valux/features/search/data/datasources/search_remote_data_source.dart';
import 'package:valux/features/search/data/repositories/search_repository_impl.dart';
import 'package:valux/features/search/domain/usecases/search_usecase.dart';
import '../features/address/data/datasources/address_remote_data_source.dart';
import '../features/address/domain/repositories/address_repository.dart';
import '../features/auth/domain/repositories/auth_repository.dart';
import '../features/cart/domain/repositories/cart_repository.dart';
import '../features/details/domain/repositories/details_repository.dart';
import '../features/favourites/domain/repositories/favourites_repository.dart';
import '../features/layout/cubit/category/category_cubit.dart';
import '../features/layout/cubit/home/home_cubit.dart';
import '../features/layout/domain/repositories/layout_repository.dart';
import '../features/profile/cubit/profile_cubit.dart';
import '../features/profile/domain/repositories/profile_repository.dart';
import '../features/search/domain/repositories/search_repository.dart';

GetIt sl = GetIt.instance;

Future<void> init() async {
  // onboarding //
  sl.registerLazySingleton<OnboardingCubit>(() => OnboardingCubit());

  // Auth //
  sl.registerLazySingleton<AuthCubit>(
      () => AuthCubit(userLoginUseCase: sl(), userRegisterUseCase: sl()));

  sl.registerLazySingleton<UserLoginUseCase>(
      () => UserLoginUseCase(authRepository: sl()));

  sl.registerLazySingleton<UserRegisterUseCase>(
      () => UserRegisterUseCase(authRepository: sl()));

  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(networkInfo: sl(), remoteDataSource: sl()));

  sl.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(apiService: sl()));

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));

  sl.registerLazySingleton<ApiService>(() => ApiServiceImpl());

  sl.registerLazySingleton(() => InternetConnectionChecker());

  sl.registerLazySingleton<LayoutCubit>(() => LayoutCubit());

  // home //

  sl.registerLazySingleton<HomeCubit>(() => HomeCubit(
        getHomeDataUseCase: sl(),
        addDeleteFavUseCase: sl(),
        categoryProductUseCase: sl(),
      ));

  sl.registerLazySingleton<GetHomeDataUseCase>(
      () => GetHomeDataUseCase(layoutRepository: sl()));

  sl.registerLazySingleton<GetCategoryProductUseCase>(
      () => GetCategoryProductUseCase(layoutRepository: sl()));

  sl.registerLazySingleton<AddDeleteFavUseCase>(
      () => AddDeleteFavUseCase(layoutRepository: sl()));

  sl.registerLazySingleton<LayoutRepository>(
      () => LayoutRepositoryImpl(remoteDataSource: sl(), networkInfo: sl(), localDataSource: sl()));


  sl.registerLazySingleton<LayoutRemoteDataSource>(
      () => LayoutRemoteDataSourceImpl(apiService: sl()));

  sl.registerLazySingleton<LayoutLocalDataSource>(
          () => LayoutLocalDataSourceImpl());

  // categories //
  sl.registerLazySingleton<CategoryCubit>(
      () => CategoryCubit(getCategoriesUseCase: sl()));

  sl.registerLazySingleton<GetCategoriesUseCase>(
      () => GetCategoriesUseCase(layoutRepository: sl()));

  // details //
  sl.registerLazySingleton<DetailsCubit>(
      () => DetailsCubit(addDeleteToCartUseCase: sl()));

  sl.registerLazySingleton<AddDeleteToCartUseCase>(
      () => AddDeleteToCartUseCase(detailsRepository: sl()));

  sl.registerLazySingleton<DetailsRepository>(
      () => DetailsRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  sl.registerLazySingleton<DetailsRemoteDataSource>(
      () => DetailsRemoteDataSourceImpl(apiServices: sl()));

  // fav //
  sl.registerLazySingleton<FavouriteCubit>(
      () => FavouriteCubit(getFavUseCase: sl()));
  sl.registerLazySingleton(() => GetFavUseCase(favouritesRepository: sl()));
  sl.registerLazySingleton<FavouritesRepository>(() =>
      FavouritesRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  sl.registerLazySingleton<FavouritesRemoteDataSource>(
      () => FavouritesRemoteDataSourceImpl(apiService: sl()));

  // search //
  sl.registerLazySingleton<SearchCubit>(() => SearchCubit(searchUseCase: sl()));

  sl.registerLazySingleton<SearchUseCase>(
      () => SearchUseCase(searchRepository: sl()));
  sl.registerLazySingleton<SearchRemoteDataSource>(
      () => SearchRemoteDataSourceImpl(apiService: sl()));
  sl.registerLazySingleton<SearchRepository>(
      () => SearchRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  // Carts //
  sl.registerLazySingleton(() => CartsCubit(getCartsUseCase: sl()));
  sl.registerLazySingleton<GetCartsUseCase>(
      () => GetCartsUseCase(cartRepository: sl()));

  sl.registerLazySingleton<CartRepository>(
      () => CartRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  sl.registerLazySingleton<CartRemoteDataSource>(
      () => CartRemoteDataSourceImpl(apiService: sl()));

  // profile //

  sl.registerLazySingleton<ProfileCubit>(() => ProfileCubit(
      updateUserUseCase: sl(),
      changePassUseCase: sl(),
      getProfileDataUseCase: sl()));
  sl.registerLazySingleton<UpdateUserUseCase>(
      () => UpdateUserUseCase(profileRepository: sl()));

  sl.registerLazySingleton<GetProfileDataUseCase>(
      () => GetProfileDataUseCase(profileRepository: sl()));

  sl.registerLazySingleton<ProfileRemoteDataSource>(
      () => ProfileRemoteDataSourceImpl(apiService: sl()));

  sl.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  sl.registerLazySingleton<ChangePassUseCase>(
      () => ChangePassUseCase(profileRepository: sl()));

  /// address ///

  sl.registerLazySingleton<AddressCubit>(
      () => AddressCubit(getAddressesUseCase: sl()));
  sl.registerLazySingleton<GetAddressesUseCase>(
      () => GetAddressesUseCase(addressRepository: sl()));

  sl.registerLazySingleton<AddressRepository>(
      () => AddressRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  sl.registerLazySingleton<AddressRemoteDataSource>(
      () => AddressRemoteDataSourceImpl(apiService: sl()));

  /// order ///

  sl.registerLazySingleton<OrderCubit>(
      () => OrderCubit(makeOrderUseCase: sl(), getMyOrdersUseCase: sl()));

  sl.registerLazySingleton<MakeOrderUseCase>(
      () => MakeOrderUseCase(orderRepository: sl()));

  sl.registerLazySingleton<OrderRepository>(
      () => OrderRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  sl.registerLazySingleton<OrderRemoteDataSource>(
      () => OrderRemoteDataSourceImpl(myFirebase: sl()));

  sl.registerLazySingleton<MyFirebase>(() => MyFirebaseImpl());

  sl.registerLazySingleton<GetMyOrdersUseCase>(() => GetMyOrdersUseCase(orderRepository: sl()));


}
