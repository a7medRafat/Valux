import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../cubit/onboarding_cubit.dart';
import '../widgets/onboarding_item.dart';
import '../widgets/page_indecator.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<OnboardingCubit, OnboardingState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = context.read<OnboardingCubit>();
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.3,
                  child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    controller: cubit.onboardController,
                    itemCount: cubit.boarding.length,
                    itemBuilder: (context, index) {
                      return OnboardingItem(
                        img: cubit.boarding[index].image!,
                        title: cubit.boarding[index].title!,
                        body: cubit.boarding[index].body!,
                      );
                    },
                    onPageChanged: (int index) {
                      cubit.onPageChanged(index);
                    },
                  ),
                ),
                SizedBox(height: 20.h),
                PageIndicator(
                    onboardController: cubit.onboardController,
                    function: () {
                      cubit.nextPage(context);
                    },
                    list: cubit.boarding)
              ],
            ),
          );
        },
      ),
    );
  }
}
