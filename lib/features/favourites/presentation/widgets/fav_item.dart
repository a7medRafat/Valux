import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valux/config/colors/app_colors.dart';
import 'package:valux/core/utils/vContainer.dart';
import 'package:valux/features/favourites/presentation/widgets/remove.dart';
import '../../../layout/cubit/home/home_cubit.dart';
import 'fav_price.dart';
import 'image.dart';
import 'name.dart';

class FavItem extends StatelessWidget {
  const FavItem(
      {super.key,
      required this.img,
      required this.name,
      required this.price,
      this.oldPrice,
      required this.productId,
      required this.discountValue,
      required this.discount,
      this.function});

  final String img;
  final String name;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final dynamic productId;
  final dynamic discountValue;
  final Function()? function;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return VContainer(
          function: function,
          padding:
              const EdgeInsets.only(top: 15, bottom: 5, left: 10, right: 10),
          margin: const EdgeInsets.all(5),
          color: AppColors.vWhite,
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FavImg(img: img),
                  Column(
                    children: [
                      FavPrice(
                          price: price,
                          oldPrice: oldPrice,
                          discount: discount,
                          discountValue: discountValue),
                      Name(name: name, productId: productId),
                    ],
                  ),
                ],
              ),
              RemoveFav(productId: productId)
            ],
          ),
        );
      },
    );
  }
}
