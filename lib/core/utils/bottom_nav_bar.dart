import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:valux/features/layout/cubit/layout/layout_cubit.dart';
import '../../../../App/injuctoin_container.dart';
import '../../../../config/colors/app_colors.dart';
import '../../config/style/icons_broken.dart';

class SalomonBottomNav extends StatelessWidget {
  const SalomonBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BlocBuilder<LayoutCubit, LayoutState>(
        builder: (context, state) {
          return SalomonBottomBar(
            currentIndex: sl<LayoutCubit>().currentNavIndex,
            onTap: (index) => sl<LayoutCubit>().changeNavButton(index, context),
            backgroundColor: AppColors.vBottomNavColor,
            items: [
              SalomonBottomBarItem(
                icon: const Icon(IconBroken.Home),
                title: const Text("Home"),
                selectedColor: Colors.blue,
              ),
              SalomonBottomBarItem(
                icon: const Icon(IconBroken.Search),
                title: const Text("Search"),
                selectedColor: Colors.blue,
              ),
              SalomonBottomBarItem(
                icon: const Icon(IconBroken.Heart),
                title: const Text("Favourites"),
                selectedColor: Colors.blue,
              ),
              SalomonBottomBarItem(
                icon: const Icon(IconBroken.Buy),
                title: const Text("Cart"),
                selectedColor: Colors.blue,
              ),
            ],
          );
        },
      ),
    );
  }
}
