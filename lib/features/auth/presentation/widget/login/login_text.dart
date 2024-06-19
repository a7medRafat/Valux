import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/config/Strings/app_strings.dart';
import 'package:valux/config/style/app_fonts.dart';

class LoginText extends StatelessWidget {
  const LoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.login, style: AppFonts.headline1),
        SizedBox(height: 10.h),
        Text(AppStrings.loginPhrase,
            style: AppFonts.headline3),
      ],
    );
  }
}
