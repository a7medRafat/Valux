import 'package:flutter/cupertino.dart';
import 'package:valux/config/colors/app_colors.dart';
import 'package:valux/core/utils/app_button.dart';

class AddressButton extends StatelessWidget {
  const AddressButton({super.key, required this.function});

  final Function() function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, top: 20, bottom: 20),
      child: AppButton(
        function: function,
        text: 'add address',
        btnColor: AppColors.vBlue,
        radius: BorderRadius.zero,
        txtColor: AppColors.vWhite,
      ),
    );
  }
}
