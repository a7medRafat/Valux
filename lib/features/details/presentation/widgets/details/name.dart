import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valux/config/colors/app_colors.dart';
import 'package:valux/config/style/app_fonts.dart';
import '../../../../../App/injuctoin_container.dart';
import '../../../../layout/cubit/home/home_cubit.dart';

class ProductName extends StatelessWidget {
  const ProductName({super.key, required this.name, required this.id});

  final String name;
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 4,
                child: Text(name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppFonts.productName),
              ),
              Expanded(
                flex: 1,
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColors.scaffoldColor,
                  child: Center(
                    child: IconButton(
                        onPressed: () =>
                            sl<HomeCubit>().addDeleteFav(productId: id),
                        icon: Icon(
                            sl<HomeCubit>().favourites[id] == true
                                ? Icons.favorite
                                : CupertinoIcons.heart,
                            size: 25)),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
