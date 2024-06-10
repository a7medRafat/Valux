import 'package:flutter/material.dart';
import 'package:valux/config/style/icons_broken.dart';
import 'package:valux/core/local_storage/hive_keys.dart';
import 'package:valux/core/local_storage/user_storage.dart';
import 'package:valux/features/layout/cubit/layout/layout_cubit.dart';
import 'package:valux/features/layout/presentation/widgets/drawer/points.dart';
import 'package:valux/features/layout/presentation/widgets/drawer/profile.dart';
import 'package:valux/features/layout/presentation/widgets/drawer/title_Item.dart';
import '../../../../../App/injuctoin_container.dart';
import '../../../../../config/colors/app_colors.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero),
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
              children: [
                Profile(),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(UserData().getData(id: Keys.user)!.name!,
                        style: Theme.of(context).textTheme.bodyLarge),
                    Text(UserData().getData(id: Keys.user)!.email!,
                        style: Theme.of(context).textTheme.bodySmall),
                    const SizedBox(height: 8),
                    PointsAndCredits(
                        credit: UserData()
                            .getData(id: Keys.user)!
                            .credit!
                            .toString(),
                        points: UserData()
                            .getData(id: Keys.user)!
                            .points!
                            .toString())
                  ],
                ),
              ],
            ),
          ),
          TitleItem(
            backColor: AppColors.vWhite,
            text: 'Profile',
            icon: IconBroken.Profile,
            function: () => Navigator.pop(context),
          ), //DrawerHeader
          TitleItem(
            backColor: AppColors.vRed.withOpacity(0.7),
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
