import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem(
      {super.key, required this.img, required this.title, required this.body});

  final String img;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(img),
        ),
        SizedBox(height: 20.h),
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        SizedBox(height: 10.h),
        Text(body, style: Theme.of(context).textTheme.titleSmall),
      ],
    );
  }
}
