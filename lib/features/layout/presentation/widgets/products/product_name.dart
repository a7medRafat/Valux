import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductName extends StatelessWidget {
  const ProductName({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 13),
          name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
