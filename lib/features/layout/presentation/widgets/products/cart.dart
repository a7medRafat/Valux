import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({super.key, required this.function, required this.icon});

  final Function() function;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: AlignmentDirectional.topEnd,
        child: IconButton(onPressed: function, icon: Icon(icon)));
  }
}
