import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/core/utils/vContainer.dart';

import '../../../../../config/colors/app_colors.dart';

class ConfirmHead extends StatelessWidget {
  const ConfirmHead({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: VContainer(
        color: AppColors.confirmation,
        height: MediaQuery.of(context).size.height / 3,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/purchase.png',
                height: 80.h,
                width: 80.w,
              ),
              const SizedBox(height: 10),
              const Text('Good news! Your order is on the way!')
            ],
          ),
        ),
      ),
    );
  }
}
