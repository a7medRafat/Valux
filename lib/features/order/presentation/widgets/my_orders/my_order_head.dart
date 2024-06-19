import 'package:flutter/cupertino.dart';
import 'package:valux/core/utils/vContainer.dart';
import '../../../../../config/colors/app_colors.dart';
import '../../../../../core/utils/arrow_back.dart';

class MyOrderHead extends StatelessWidget {
  const MyOrderHead({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20,right: 20),
      child: VContainer(
        color: AppColors.vWhite,
        height: MediaQuery.of(context).size.height / 2.5,
        child: Center(
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Image.asset(
                height: MediaQuery.of(context).size.height / 2.5,
                'assets/images/order.jpg',
                fit: BoxFit.cover,
              ),
              const ArrowBack()
            ],
          ),
        ),
      ),
    );
  }
}
