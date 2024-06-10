import 'package:flutter/material.dart';

class TitleItem extends StatelessWidget {
  const TitleItem(
      {super.key,
      required this.backColor,
      required this.text,
      required this.icon,
      required this.function});

  final Color backColor;
  final String text;
  final IconData icon;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        color: backColor,
        child: ListTile(
            leading: Icon(
              icon,
              size: 20,
            ),
            title: Text(text, style: Theme.of(context).textTheme.bodyMedium),
            onTap: function),
      ),
    );
  }
}
