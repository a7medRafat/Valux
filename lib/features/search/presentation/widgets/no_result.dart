import 'package:flutter/cupertino.dart';
import 'package:valux/config/colors/app_colors.dart';
import 'package:valux/config/style/app_fonts.dart';

class NoResult extends StatelessWidget {
  const NoResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'No Result',
      style: AppFonts.regular2);
  }
}
