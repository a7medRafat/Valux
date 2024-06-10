import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/config/colors/app_colors.dart';
import 'package:valux/core/utils/vContainer.dart';
import 'package:valux/features/search/presentation/widgets/search_img.dart';
import 'package:valux/features/search/presentation/widgets/search_name.dart';
import 'package:valux/features/search/presentation/widgets/search_price.dart';
import '../../../layout/cubit/home/home_cubit.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({
    super.key,
    required this.img,
    required this.name,
    required this.price,
    required this.productId,
    required this.inFav,
    required this.inCart,
    required this.function,
  });

  final String img;
  final String name;
  final bool inFav;
  final bool inCart;
  final dynamic price;
  final dynamic productId;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return VContainer(
          function: function,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(5),
          height: 80.sp,
          color: AppColors.vWhite,
          borderRadius: BorderRadius.circular(10),

          child: Row(
            children: [
              SearchImg(img: img),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SearchName(name: name),
                    SearchPrice(price: price, inFav: inFav, inCart: inCart)
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
