import 'package:flutter/cupertino.dart';

class Info extends StatelessWidget {

  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        top: 15,
        bottom: 10,
        left: 5

      ),
      child: Text(
        'your information',
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
