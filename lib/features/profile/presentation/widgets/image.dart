import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/config/style/icons_broken.dart';
import 'package:valux/core/local_storage/hive_keys.dart';
import 'package:valux/core/local_storage/user_storage.dart';
import 'package:valux/features/profile/cubit/profile_cubit.dart';
import 'package:valux/features/profile/presentation/widgets/update.dart';
import '../../../../App/injuctoin_container.dart';
import '../../../../config/colors/app_colors.dart';
import '../../../../core/utils/vContainer.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage(
      {super.key, required this.function, required this.pickImg});

  final Function() function;
  final Function() pickImg;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return VContainer(
          color: AppColors.vWhite,
          height: 120.h,
          width: double.infinity,
          padding: const EdgeInsets.all(5),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              VContainer(
                color: AppColors.scaffoldColor,
                width: MediaQuery.of(context).size.width / 2.5,
                height: 120.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: Image(
                    fit: BoxFit.cover,
                    image: sl<ProfileCubit>().pickedImg == null
                        ? NetworkImage(
                            UserData().getData(id: Keys.user)!.image!)
                        : FileImage(sl<ProfileCubit>().pickedImg!)
                            as ImageProvider,
                  ),
                ),
              ),
              VContainer(
                  function: pickImg,
                  color: Colors.white,
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(5),
                  borderRadius: BorderRadius.circular(50),
                  child: const Icon(IconBroken.Camera)),
              if (sl<ProfileCubit>().pickedImg != null)
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: GestureDetector(
                          onTap: function, child: const Update()),
                    )),
            ],
          ),
        );
      },
    );
  }
}
