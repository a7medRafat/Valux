import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:valux/core/utils/vContainer.dart';

import '../../cubit/onboarding_cubit.dart';

class OnboardButton extends StatelessWidget {
  const OnboardButton({super.key, required this.widget});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return VContainer(
      color: Colors.grey.withOpacity(0.2),
      padding: OnboardingCubit.get(context).isLast
          ? const EdgeInsets.symmetric(horizontal: 15)
          : EdgeInsets.zero,
      borderRadius: BorderRadius.circular(10),
      child: widget,
    );
  }
}
