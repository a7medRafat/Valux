import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valux/core/utils/vContainer.dart';
import 'package:valux/features/details/cubit/details_cubit.dart';
import '../../../../../App/injuctoin_container.dart';
import '../../../../../config/colors/app_colors.dart';
import '../../../../layout/cubit/home/home_cubit.dart';

class Images extends StatelessWidget {
  const Images({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        height: 40,
        child: Center(
          child: BlocBuilder<DetailsCubit, DetailsState>(
            builder: (context, state) {
              return ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      customImage(images[index], index),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 8),
                  itemCount: images.length);
            },
          ),
        ),
      ),
    );
  }

  Widget customImage(img, index) => GestureDetector(
      onTap: () => sl<DetailsCubit>().changeSelectedImg(index),
      child: VContainer(
          color: Colors.white,
          height: 40,
          width: 40,
          borderRadius: BorderRadius.circular(5),
          border: sl<DetailsCubit>().selectedImg == index
              ? Border.all(color: AppColors.vBlue, width: 3)
              : Border.all(color: Colors.black54, width: 1),
          child: Image(
            image: NetworkImage(img),
          )));
}
