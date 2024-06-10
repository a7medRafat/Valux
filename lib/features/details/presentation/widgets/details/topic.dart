import 'package:flutter/material.dart';

class ProductTopic extends StatelessWidget {
  const ProductTopic({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text('Product Details:',
          style: Theme.of(context).textTheme.titleSmall),
    );
  }
}
