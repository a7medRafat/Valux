import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:valux/core/utils/vContainer.dart';

import '../../../../../config/colors/app_colors.dart';

class ShopNow extends StatelessWidget {
  const ShopNow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Text('SHOP NOW', style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 5),
          VContainer(
            color: AppColors.bodySmall,
            width: 50,
            height: 2,
          ),
        ],
      ),
    );
  }
}
