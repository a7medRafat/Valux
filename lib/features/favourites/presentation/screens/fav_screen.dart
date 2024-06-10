import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valux/core/utils/app_bar.dart';
import 'package:valux/core/utils/loading.dart';
import 'package:valux/core/utils/toast.dart';
import 'package:valux/features/favourites/cubit/favourite_cubit.dart';
import '../../../../App/injuctoin_container.dart';
import '../../../../core/utils/titles.dart';
import '../widgets/fav_grid.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  void initState() {
    sl<FavouriteCubit>().getFavourites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  const MyAppBar(title: Titles(text: 'Favourites')),
      body: BlocConsumer<FavouriteCubit, FavouriteState>(
        buildWhen: (previous, current) => current is GetFavouritesSuccessSate,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetFavouritesLoadingSate) {
            return const Center(child: Loading());
          }
          if (state is GetFavouritesErrorSate) {
            return MyToast.show(text: state.error, context: context);
          }
          if (state is GetFavouritesSuccessSate) {
            return FavGrid(favModel: state.favModel);
          }
          return const Loading();
        },
      ),
    );
  }
}
