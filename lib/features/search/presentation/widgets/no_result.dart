import 'package:flutter/cupertino.dart';
import 'package:valux/config/colors/app_colors.dart';

class NoResult extends StatelessWidget {
  const NoResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'No Result',
      style: TextStyle(fontSize: 12, color: AppColors.vGray),
    );
  }
}
