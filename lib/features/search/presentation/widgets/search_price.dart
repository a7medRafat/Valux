import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/config/style/app_fonts.dart';
import '../../../../config/colors/app_colors.dart';

class SearchPrice extends StatelessWidget {
  const SearchPrice({super.key, required this.price, required this.inFav, required this.inCart});

  final dynamic price;
  final bool inFav;
  final bool inCart;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('\$$price',
            style: AppFonts.regular1
                .copyWith(color: AppColors.vBlue)),
        SizedBox(width: 5.w),
        Row(
          children: [
            if(inFav)
              Text('in favourites',
                style: AppFonts.regular3),
            if(inFav)
              SizedBox(width: 10.w),
            if(inCart)
              Text('in cart', style: AppFonts.regular3),
          ],
        )
      ],
    );
  }
}
