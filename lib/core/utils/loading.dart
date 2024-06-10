import 'package:flutter/material.dart';

import '../../config/colors/app_colors.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: CircularProgressIndicator(

              color: AppColors.primaryColor,
              strokeWidth: 3,
            ),
    );
  }
}
