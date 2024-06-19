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

class CategoryDetailsScreen extends StatefulWidget {
  CategoryDetailsScreen({super.key, required this.id});

  final int id;
  ProductsData? product;

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  @override
  void initState() {
    widget.product = sl<HomeCubit>().getOneProducts(id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.vWhite,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.vWhite,
      body: SingleChildScrollView(
        child: BlocBuilder<DetailsCubit, DetailsState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DetailsHead(
                  img: sl<DetailsCubit>().selectedImg == -1
                      ? widget.product!.image!
                      : widget.product!.images![sl<DetailsCubit>().selectedImg],
                  discount: widget.product!.discount,
                ),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    return Images(
                      images: widget.product!.images!,
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
                            name: widget.product!.name!,
                            id: widget.product!.id!,
                          );
                        },
                      ),
                      ProductPrice(
                        price: widget.product!.price,
                        oldPrice: widget.product!.oldPrice,
                        discount: widget.product!.discount,
                        discountValue: widget.product!.discount,
                      ),
                      const ProductTopic(),
                      ProductDetails(description: widget.product!.description!),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: BlocBuilder<DetailsCubit, DetailsState>(
        builder: (context, state) {
          return AddToCart(
            function: () =>
                sl<DetailsCubit>().addDeleteToCart(
                    productId: widget.product!.id),
            inCart: sl<DetailsCubit>().inCart[widget.product!.id]!,
          );
        },
      ),
    );
  }
}
