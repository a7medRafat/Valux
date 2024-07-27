import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:valux/core/utils/vContainer.dart';
import '../../../../config/colors/app_colors.dart';
import '../../cubit/onboarding_cubit.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator(
      {super.key,
      required this.onboardController,
      required this.function,
      required this.list});

  final PageController onboardController;
  final Function() function;
  final List list;

  @override
  Widget build(BuildContext context) {
    return OnboardingCubit.get(context).isLast
        ? VContainer(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            color: Colors.grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(8),
            child: TextButton(
              onPressed: function,
              child: const Text(
                'Get Started',
                style: TextStyle(color: Colors.black),
              ),
            ),
          )
        : SmoothPageIndicator(
            controller: onboardController,
            count: list.length,
            effect: ExpandingDotsEffect(
              dotHeight: 10.h,
              dotWidth: 10.w,
              spacing: 8,
              expansionFactor: 4,
              activeDotColor: AppColors.primaryColor,
              dotColor: Colors.grey.withOpacity(0.5),
            ),
          );
  }
}
