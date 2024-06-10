import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valux/config/colors/app_colors.dart';
import 'package:valux/features/details/cubit/details_cubit.dart';
import 'package:valux/features/details/presentation/widgets/details/cart.dart';
import '../../../../App/injuctoin_container.dart';
import '../../../layout/cubit/home/home_cubit.dart';
import '../../../layout/data/models/ProductsModel.dart';
import '../widgets/details/details.dart';
import '../widgets/details/details_head.dart';
import '../widgets/details/images.dart';
import '../widgets/details/name.dart';
import '../widgets/details/price.dart';
import '../widgets/details/topic.dart';

class CategoryDetailsScreen extends StatelessWidget {
  const CategoryDetailsScreen({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.vWhite,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.vWhite,
      body: SingleChildScrollView(
        child: BlocConsumer<DetailsCubit, DetailsState>(
          listener: (context, state) {},
          builder: (context, state) {
            ProductsData product =
                sl<HomeCubit>().productsModel!.data!.data![index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailsHead(
                  img: sl<DetailsCubit>().selectedImg == -1
                      ? product.image!
                      : product.images![sl<DetailsCubit>().selectedImg],
                  discount: product.discount,
                ),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return Images(
                      images: product.images!,
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocBuilder<HomeCubit, HomeState>(
                        builder: (context, state) {
                          return ProductName(
                            name: product.name!,
                            id: product.id!,
                          );
                        },
                      ),
                      ProductPrice(
                        price: product.price,
                        oldPrice: product.oldPrice,
                        discount: product.discount,
                        discountValue: product.discount,
                      ),
                      const ProductTopic(),
                      ProductDetails(description: product.description!),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: AddToCart(
          function: () {},
          inCart: false,
        ),
      ),
    );
  }
}
