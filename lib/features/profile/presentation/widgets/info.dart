import 'package:flutter/cupertino.dart';
import 'package:valux/config/style/app_fonts.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 10, left: 5),
      child: Text(
        'your information',
        style: AppFonts.headline3,
      ),
    );
  }
}
