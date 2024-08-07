import 'package:flutter/material.dart';
import 'package:valux/config/Strings/app_strings.dart';
import 'package:valux/config/style/app_fonts.dart';
import 'package:valux/core/extensions/navigation.dart';
import '../../screen/register_screen.dart';

class RegisterNow extends StatelessWidget {
  const RegisterNow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppStrings.dontHaveAcc,
          style: AppFonts.bodyText3,
        ),
        TextButton(
          onPressed: () => context.goAndFinish(page: const RegisterScreen()),
          child: Text(AppStrings.register, style: AppFonts.regular2),
        ),
      ],
    );
  }
}
