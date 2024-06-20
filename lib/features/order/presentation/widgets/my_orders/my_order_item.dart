import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/config/colors/app_colors.dart';
import '../../../../../config/style/app_fonts.dart';
import '../../../../../core/utils/vContainer.dart';
import '../../../data/models/TestOrder.dart';

class MyOrderItem extends StatelessWidget {
  const MyOrderItem({super.key, required this.orders, required this.mainIndex});

  final List<OrderModel> orders;
  final int mainIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, top: 15, bottom: 10),
      child: VContainer(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VContainer(
                padding: const EdgeInsets.only(
                  top: 8,
                  left: 15,
                  bottom: 8,
                ),
                width: double.infinity,
                color: Colors.white,
                child: Text(orders[mainIndex].date.toString(),
                    style: AppFonts.bodyText5)),
            SizedBox(height: 5.h),
            VContainer(
              padding: const EdgeInsets.only(
                  top: 20, left: 15, bottom: 8, right: 15),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Text(
                          orders[mainIndex].product![index].name!,
                          style: AppFonts.bodyText2,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 5.h),
                      itemCount: orders[mainIndex].product!.length),
                  SizedBox(height: 10.h),
                  Text(
                    '\$${orders[mainIndex].totalPrice}',
                    style: AppFonts.regular2.copyWith(color: AppColors.vBlue),
                  ),
                  Row(
                    children: [
                      Text(
                        '${orders[mainIndex].address!.city} ,',
                        style: AppFonts.regular2,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        '${orders[mainIndex].address!.region}',
                        style: AppFonts.regular2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
