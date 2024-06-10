import 'package:flutter/material.dart';

import '../../config/colors/app_colors.dart';
class MContainer extends StatelessWidget {
  const MContainer({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white12,
        ),
        child: Icon(icon,color:AppColors.scaffoldColor));
  }
}
