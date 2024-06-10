import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColors.vBlue)),
        const SizedBox(width: 5),
        Row(
          children: [
            if(inFav)
              Text('in favourites',
                style: TextStyle(fontSize: 11,color: AppColors.vGray)),
            if(inFav)
              SizedBox(width: 10.w),
            if(inCart)
              Text('in cart', style: TextStyle(fontSize: 11,color: AppColors.vGray)),
          ],
        )
      ],
    );
  }
}
