import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/config/colors/app_colors.dart';
import 'package:valux/features/order/cubit/order_cubit.dart';
import '../../../../../App/injuctoin_container.dart';
import '../../../../../config/style/app_fonts.dart';
import '../../../../../core/utils/vContainer.dart';
import '../../../data/models/TestOrder.dart';

class MyOrderItem extends StatelessWidget {
  const MyOrderItem({super.key, required this.model});

  final OrderModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, top: 15 , bottom: 10),
      child: VContainer(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VContainer(
                function: () => sl<OrderCubit>().getMyOrders(),
                padding: const EdgeInsets.only(
                  top: 8,
                  left: 15,
                  bottom: 8,
                ),
                width: double.infinity,
                color: Colors.white,
                child: Text(model.date.toString(), style: AppFonts.bodyText5)),
            SizedBox(height: 5.h),
            VContainer(
              padding: const EdgeInsets.only(
                top: 20,
                left: 15,
                bottom: 8,
                right: 15
              ),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.separated(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Text(
                            model.product![index].name!,
                            style: AppFonts.bodyText2,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 5),
                      itemCount: model.product!.length),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\$${model.totalPrice}',
                        style: AppFonts.regular2.copyWith(
                          color: AppColors.vBlue
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '${model.address!.city} ,',
                            style: AppFonts.regular2,
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            '${model.address!.region}',
                            style: AppFonts.regular2,
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
