import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valux/features/layout/cubit/layout/layout_cubit.dart';
import '../../../../App/injuctoin_container.dart';
import '../../../../core/utils/bottom_nav_bar.dart';
import '../widgets/drawer/my_drawer.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          drawer: const MyDrawer(),
          body: sl<LayoutCubit>().screens[sl<LayoutCubit>().currentNavIndex],
          bottomNavigationBar: const SalomonBottomNav(),
        );
      },
    );
  }
}
