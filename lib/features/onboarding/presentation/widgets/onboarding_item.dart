import 'package:flutter/material.dart';

class OnboardingItem extends StatelessWidget {
  const OnboardingItem(
      {super.key, required this.img, required this.title, required this.body});

  final String img;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(image: AssetImage(img)),
        const SizedBox(height: 20),
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(height: MediaQuery.of(context).size.width/12),
        Text(
          body,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}
