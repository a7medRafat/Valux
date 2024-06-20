import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/config/style/icons_broken.dart';
import 'package:valux/core/local_storage/hive_keys.dart';
import 'package:valux/core/local_storage/user_storage.dart';
import 'package:valux/features/layout/cubit/layout/layout_cubit.dart';
import 'package:valux/features/layout/presentation/widgets/drawer/points.dart';
import 'package:valux/features/layout/presentation/widgets/drawer/profile.dart';
import 'package:valux/features/layout/presentation/widgets/drawer/title_Item.dart';
import 'package:valux/features/order/presentation/screens/my_orders.dart';
import '../../../../../App/injuctoin_container.dart';
import '../../../../../config/colors/app_colors.dart';
import '../../../../../core/go/go.dart';
import 'name.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width - 50.w,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      backgroundColor: AppColors.scaffoldColor,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.vWhite,
            ), //BoxDecoration
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Profile(),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const DrawerName(),
                      SizedBox(height: 8.h),
                      PointsAndCredits(
                        credit: UserData()
                            .getData(id: Keys.user)!
                            .credit!
                            .toString(),
                        points: UserData()
                            .getData(id: Keys.user)!
                            .points!
                            .toString(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          TitleItem(
            backColor: AppColors.vWhite,
            text: 'My Orders',
            icon: IconBroken.Buy,
            function: () => Go.goTo(context, const MyOrdersScreen()),
          ), //DrawerHeader
          TitleItem(
            backColor: AppColors.vWhite,
            text: 'Logout',
            icon: IconBroken.Logout,
            function: () {
              sl<LayoutCubit>().logOut(context);
            },
          ), //DrawerHeader
        ],
      ),
    ); //Drawer
  }
}
