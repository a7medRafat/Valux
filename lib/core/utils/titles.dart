import 'package:flutter/cupertino.dart';
import 'package:valux/config/style/app_fonts.dart';

class Titles extends StatelessWidget {
  const Titles({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: AppFonts.headline2);
  }
}
