import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:valux/core/utils/vContainer.dart';
import '../../../../../config/colors/app_colors.dart';
import '../../../../../core/utils/arrow_back.dart';

class ConfirmHead extends StatelessWidget {
  const ConfirmHead({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: VContainer(
        color: AppColors.vWhite,
        height: MediaQuery.of(context).size.height / 3,
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                height: MediaQuery.of(context).size.height / 3,
                'assets/images/confirm.jpg',
                fit: BoxFit.fill,
              ),
              const ArrowBack()
            ],
          ),
        ),
      ),
    );
  }
}
