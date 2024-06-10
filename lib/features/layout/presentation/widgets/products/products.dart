import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valux/core/go/go.dart';
import 'package:valux/core/utils/loading.dart';
import 'package:valux/core/utils/vContainer.dart';
import 'package:valux/features/details/presentation/screens/details_screen.dart';
import 'package:valux/features/details/presentation/screens/category_details_screen.dart';
import 'package:valux/features/layout/data/models/HomeModel.dart';
import 'package:valux/features/layout/presentation/widgets/products/product_img.dart';
import 'package:valux/features/layout/presentation/widgets/products/product_name.dart';
import 'package:valux/features/layout/presentation/widgets/products/shop_now.dart';
import '../../../../../App/injuctoin_container.dart';
import '../../../cubit/category/category_cubit.dart';
import '../../../cubit/home/home_cubit.dart';
import 'like.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.homeModel});

  final HomeModel homeModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GetProductsLoadingStates) {
          return const Center(child: Loading());
        }
        return BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
            return GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 1 / 1.3,
              children: List.generate(
                sl<CategoryCubit>().selectedCategory == -1
                    ? homeModel.data!.products!.length
                    : sl<HomeCubit>().productsModel!.data!.data!.length,
                (index) => GestureDetector(
                  onTap: () {
                    sl<CategoryCubit>().selectedCategory == -1
                        ? Go.goTo(
                            context,
                            DetailsScreen(
                                id: homeModel.data!.products![index].id))
                        : Go.goTo(context, CategoryDetailsScreen(index: index));
                  },
                  child: VContainer(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Stack(
                            alignment: AlignmentDirectional.topCenter,
                            children: [
                              ProductImg(
                                  img: sl<CategoryCubit>().selectedCategory ==
                                          -1
                                      ? homeModel.data!.products![index].image!
                                      : sl<HomeCubit>()
                                          .productsModel!
                                          .data!
                                          .data![index]
                                          .image!),
                              Like(
                                  function: () {
                                    sl<HomeCubit>().addDeleteFav(
                                        productId: sl<CategoryCubit>()
                                                    .selectedCategory ==
                                                -1
                                            ? homeModel
                                                .data!.products![index].id!
                                            : sl<HomeCubit>()
                                                .productsModel!
                                                .data!
                                                .data![index]
                                                .id);
                                  },
                                  icon: sl<HomeCubit>().like(index)),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              ProductName(
                                name: sl<CategoryCubit>().selectedCategory == -1
                                    ? homeModel.data!.products![index].name!
                                    : sl<HomeCubit>()
                                        .productsModel!
                                        .data!
                                        .data![index]
                                        .name!,
                              ),
                              const ShopNow(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
