import 'package:flutter/material.dart';
import '../../../../config/colors/app_colors.dart';

class Update extends StatelessWidget {

  const Update({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.blue.withOpacity(0.3),
      child: Icon(Icons.check_outlined,
          color: AppColors.bodySmall),
    );
  }
}
