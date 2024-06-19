import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/config/style/app_fonts.dart';
import '../../../../config/colors/app_colors.dart';
import '../../../../core/utils/my_Divider.dart';
import '../../../../core/utils/vContainer.dart';

class Quantity extends StatelessWidget {
  const Quantity(
      {super.key,
      required this.add,
      required this.minus,
      required this.counter});

  final Function() add;
  final Function() minus;
  final int counter;

  @override
  Widget build(BuildContext context) {
    return VContainer(
      shadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 3,
          blurRadius: 5,
          offset: const Offset(0, 1), // changes position of shadow
        ),
      ],
      width: MediaQuery.of(context).size.width / 2.5,
      height: 40.h,
      color: Colors.white,
      child: IntrinsicHeight(
        child: Row(
          children: [
            addOrMinus(icon: Icons.add, function: add),
            const MyDivider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                counter.toString(),
                style: AppFonts.bodyText2.copyWith(color: AppColors.vBlue),
              ),
            ),
            const MyDivider(),
            addOrMinus(icon: Icons.remove, function: minus),
          ],
        ),
      ),
    );
  }

  Widget addOrMinus({required IconData icon, required Function() function}) =>
      Expanded(
        child: VContainer(
          function: function,
          padding: const EdgeInsets.all(5),
          color: AppColors.vWhite,
          child: Center(
            child: Icon(icon, color: AppColors.vGray, size: 20),
          ),
        ),
      );
}
