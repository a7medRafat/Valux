import 'package:flutter/material.dart';
import 'package:valux/config/colors/app_colors.dart';
import 'package:valux/core/go/go.dart';

import '../../screen/register_screen.dart';

class RegisterNow extends StatelessWidget {
  const RegisterNow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account?',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        TextButton(
            onPressed: () {
              Go.goAndFinish(context, RegisterScreen());
            },
            child: Text('Register Now',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: AppColors.primaryColor))),
      ],
    );
  }
}
