import 'package:flutter/material.dart';

class Like extends StatelessWidget {
  const Like({super.key, required this.function, required this.icon});

  final Function() function;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: AlignmentDirectional.topEnd,
        child: IconButton(onPressed: function, icon: Icon(icon)));
  }
}
