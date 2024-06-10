import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:valux/core/go/go.dart';
import 'package:valux/features/details/presentation/screens/details_screen.dart';
import 'package:valux/features/favourites/data/models/FavModel.dart';

import 'fav_item.dart';

class FavGrid extends StatelessWidget {
  const FavGrid({super.key, required this.favModel});

  final FavModel favModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
          children: [
            ...List.generate(
              favModel.data!.data!.length,
              (index) {
                Product product = favModel.data!.data![index].product!;
                return StaggeredGridTile.count(
                  crossAxisCellCount: 1,
                  mainAxisCellCount: index == 0 ? 1.3 : 1.6,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: GestureDetector(
                      onTap: () {},
                      child: FavItem(
                        function: () =>
                            Go.goTo(context, DetailsScreen(id: product.id!)),
                        img: product.image!,
                        name: product.name!,
                        price: product.price!,
                        oldPrice: product.oldPrice!,
                        discount: product.discount!,
                        productId: product.id,
                        discountValue: product.discount,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
