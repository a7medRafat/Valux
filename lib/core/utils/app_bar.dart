import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/config/colors/app_colors.dart';
import 'package:valux/features/layout/cubit/layout/layout_cubit.dart';

import '../../App/injuctoin_container.dart';
import '../local_storage/hive_keys.dart';
import '../local_storage/user_storage.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar(
      {super.key,
      required this.title,
      this.actions,
      this.leading,
      this.backColor,
     });

  final Widget title;
  final List<Widget>? actions;
  final Widget? leading;
  final Color? backColor;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      centerTitle: true,
      titleSpacing: 4,
      elevation: 0,
      backgroundColor: backColor ?? AppColors.scaffoldColor,
      leading: leading ??
          Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: ()=>sl<LayoutCubit>().scaffoldKey.currentState!.openDrawer(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  UserData().getData(id: Keys.user)!.image!,
                  fit: BoxFit.cover,
                  width: 40.w,
                  height: 40.h,
                  errorBuilder: (context, exception, stackTrace) {
                    return const Icon(Icons.error_outline);
                  },
                ),
              ),
            ),
          ),
      actions: actions,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: title,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
