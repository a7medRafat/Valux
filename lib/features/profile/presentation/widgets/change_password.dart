import 'package:flutter/cupertino.dart';
import 'package:valux/config/colors/app_colors.dart';
import 'package:valux/core/go/go.dart';
import 'package:valux/core/utils/app_button.dart';
import 'package:valux/features/profile/presentation/screens/change_pass_screen.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: AppButton(
          function: ()=>Go.goTo(context, ChangePassScreen()),
          radius: BorderRadius.zero,
          btnColor: AppColors.primaryColor,
          txtColor: AppColors.vWhite,
          text: 'change password'),
    );
  }
}
