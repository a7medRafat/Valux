import 'package:flutter/material.dart';
import '../../config/colors/app_colors.dart';
import '../../config/style/icons_broken.dart';
import 'container.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.leagueName,
  });

  final String leagueName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const MContainer(
                icon: IconBroken.Arrow___Left,
              )),
          Expanded(
            child: Center(
              child: Text(leagueName,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: AppColors.scaffoldColor)),
            ),
          ),
        ],
      ),
    );
  }
}
