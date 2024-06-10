import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PointsAndCredits extends StatelessWidget {
  const PointsAndCredits(
      {super.key, required this.credit, required this.points});

  final String credit;
  final String points;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            text(context,'Credits'),
            const SizedBox(width: 5),
            text(context,credit),
          ],
        ),
        const SizedBox(width: 10),
        Row(
          children: [
            text(context,'Points'),
            const SizedBox(width: 5),
            text(context,points),
          ],
        ),
      ],
    );
  }

  Widget text(context , String text) =>
      Text(text, style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 11));
}
