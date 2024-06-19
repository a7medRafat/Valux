import 'package:flutter/material.dart';
import 'package:valux/config/style/app_fonts.dart';

class ProductTopic extends StatelessWidget {
  const ProductTopic({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8,top: 8),
      child: Text('Product Details:',
          style: AppFonts.bodyText1),
    );
  }
}
