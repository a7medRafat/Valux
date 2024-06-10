import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valux/features/details/cubit/details_cubit.dart';
import '../../../../../App/injuctoin_container.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailsCubit, DetailsState>(
      listener: (BuildContext context, Object? state) {},
      builder: (BuildContext context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              description,
              maxLines: sl<DetailsCubit>().isExpanded ? null : 3,
              overflow: TextOverflow.fade,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            InkWell(
              onTap: () => sl<DetailsCubit>().changeExpanded(),
              child: Text(
                sl<DetailsCubit>().isExpanded ? 'See Less' : 'See More',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.blue),
              ),
            ),
          ],
        );
      },
    );
  }
}
