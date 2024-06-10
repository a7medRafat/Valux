import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/local_storage/hive_keys.dart';
import '../../../../../core/local_storage/user_storage.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Image.network(
        UserData().getData(id: Keys.user)!.image!,
        fit: BoxFit.cover,
        width: 50.sp,
        height: 50.sp,
        errorBuilder: (context, exception, stackTrace) {
          return const Icon(Icons.error_outline);
        },
      ),
    );
  }
}
