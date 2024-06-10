import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valux/config/style/icons_broken.dart';
import 'package:valux/core/go/go.dart';
import 'package:valux/core/utils/app_bar.dart';
import 'package:valux/core/utils/loading.dart';
import 'package:valux/core/utils/toast.dart';
import 'package:valux/features/layout/cubit/category/category_cubit.dart';
import 'package:valux/features/layout/presentation/widgets/products/products.dart';
import '../../../../App/injuctoin_container.dart';
import '../../../../core/utils/titles.dart';
import '../../../profile/presentation/screens/profile_screen.dart';
import '../../cubit/home/home_cubit.dart';
import '../widgets/banners/banners.dart';
import '../widgets/category/categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: const Titles(text: 'Valux'),
        actions: [
          IconButton(
              onPressed: () => Go.goTo(context, ProfileScreen()),
              icon: const Icon(IconBroken.Setting))
        ],
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is AddDeleteToFavSuccessState) {
            MyToast.show(text: state.model.message!, context: context);
          }
        },
        buildWhen: (previous, current) => current is GetHomeDataSuccessStates,
        builder: (context, state) {
          if (state is GetHomeDataLoadingStates ||
              state is GetCategoriesLoadingStates) {
            return const Center(child: Loading());
          } else {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Banners(
                      length: sl<HomeCubit>().homeModel!.data!.banners!.length,
                      homeModel: sl<HomeCubit>().homeModel!,
                    ),
                    const SizedBox(height: 15),
                    const Categories(),
                    const SizedBox(height: 15),
                    ProductItem(homeModel: sl<HomeCubit>().homeModel!),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
