import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valux/core/shared_widgets/app_bar.dart';
import 'package:valux/core/shared_widgets/toast.dart';
import 'package:valux/features/favourites/cubit/favourite_cubit.dart';
import '../../../../core/shared_widgets/ani_loading.dart';
import '../../../../core/shared_widgets/no_item.dart';
import '../../../../core/utils/titles.dart';
import '../widgets/fav_grid.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: Titles(text: 'Favourites')),
      body: BlocConsumer<FavouriteCubit, FavouriteState>(
        buildWhen: (previous, current) => current is GetFavouritesSuccessSate,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetFavouritesLoadingSate) {
            return const Center(child: AnimationLoading());
          }
          if (state is GetFavouritesErrorSate) {
            return MyToast.show(text: state.error, context: context);
          }
          if (state is GetFavouritesSuccessSate) {
            if (state.favModel.data!.data!.isEmpty) {
              return const NoItem();
            }
            return FavGrid(
              favModel: state.favModel,
            );
          }
          return const Center(child: AnimationLoading());
        },
      ),
    );
  }
}
