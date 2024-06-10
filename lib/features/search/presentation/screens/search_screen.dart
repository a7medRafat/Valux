import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/core/go/go.dart';
import 'package:valux/core/utils/app_bar.dart';
import 'package:valux/core/utils/linear_loading.dart';
import 'package:valux/features/details/presentation/screens/details_screen.dart';
import 'package:valux/features/search/cubit/search_cubit.dart';
import 'package:valux/features/search/data/models/SearchModel.dart';
import 'package:valux/features/search/presentation/widgets/search_item.dart';
import '../widgets/no_result.dart';
import '../widgets/search_input.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: SearchInput(searchController: searchController)),
      body: BlocBuilder<SearchCubit, SearchState>(
        buildWhen: (previous, current) => current is SearchSuccessState,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BlocBuilder<SearchCubit, SearchState>(
                  builder: (context, state) {
                    if (state is SearchLoadingState) {
                      return const LinearLoading();
                    } else if (state is SearchErrorState) {
                      return const Center(child: NoResult());
                    } else if (state is SearchSuccessState) {
                      return Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              SearchData product =
                                  state.model.data!.data![index];
                              return SearchItem(
                                img: product.image!,
                                name: product.name!,
                                price: product.price!,
                                productId: product.id!,
                                inFav: product.inFavorites!,
                                inCart: product.inCart!,
                                function: () => Go.goTo(
                                    context,
                                    DetailsScreen(
                                        id: state
                                            .model.data!.data![index].id!)),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 2.h),
                            itemCount: state.model.data!.data!.length),
                      );
                    }
                    return const Center(child: NoResult());
                  },
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
