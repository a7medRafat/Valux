import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../config/colors/app_colors.dart';
import '../../cubit/onboarding_cubit.dart';
import 'onboard_button.dart';

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
    return Row(
      children: [
        SmoothPageIndicator(
          controller: onboardController,
          count: list.length,
          effect: ExpandingDotsEffect(
            dotHeight: 10,
            dotWidth: 10,
            spacing: 5,
            expansionFactor: 5,
            activeDotColor: AppColors.primaryColor,
            dotColor: Colors.grey.withOpacity(0.7),
          ),
        ),
        const Spacer(),
        BlocListener<OnboardingCubit, OnboardingState>(
            listener: (context, state) {},
            child: OnboardButton(
              widget: OnboardingCubit.get(context).isLast
                  ? TextButton(
                      onPressed: function,
                      child: const Text('Get Started',style: TextStyle(color: Colors.black)),
                    )
                  : IconButton(
                      onPressed: function,
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: AppColors.primaryColor,
                      )),
            )),
      ],
    );
  }
}
