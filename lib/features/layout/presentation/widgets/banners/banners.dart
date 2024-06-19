import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubit/home/home_cubit.dart';
import '../../../data/models/HomeModel.dart';

class Banners extends StatelessWidget {
  const Banners({super.key, required this.length, required this.homeModel});

  final int length;

  final HomeModel homeModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return CarouselSlider.builder(
          itemCount: length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  Image.network(
            homeModel.data!.banners![itemIndex].image!,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            errorBuilder: (context, exception, stackTrace) {
              return const Icon(Icons.error_outline);
            },
          ),
          options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.scale,
              enlargeFactor: 0.3,
              viewportFraction: 1,
              enableInfiniteScroll: true,
              scrollDirection: Axis.horizontal,
              padEnds: false,
              onPageChanged: (index, reason) {}),
        );
      },
    );
  }
}
