import 'package:flutter/cupertino.dart';
import '../../../../../config/style/app_fonts.dart';
import '../../../../../core/local_storage/hive_keys.dart';
import '../../../../../core/local_storage/user_storage.dart';

class DrawerName extends StatelessWidget {
  const DrawerName({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          UserData().getData(id: Keys.user)!.name!,
          style: AppFonts.headline3),
    );
  }
}
