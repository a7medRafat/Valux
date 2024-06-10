import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:valux/config/colors/app_colors.dart';
import 'package:valux/core/utils/app_button.dart';

class UpdateButton extends StatelessWidget {
  const UpdateButton({super.key, required this.function});

  final Function() function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: AppButton(
          btnColor: AppColors.vBlue.withOpacity(0.8),
          txtColor: AppColors.vWhite,
          radius: BorderRadius.zero,
          function: function,
          text: 'update'),
    );
  }
}
