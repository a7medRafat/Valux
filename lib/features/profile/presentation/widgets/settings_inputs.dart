import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/core/local_storage/hive_keys.dart';
import 'package:valux/core/local_storage/user_storage.dart';
import '../../../../core/utils/default_text_field.dart';

class SettingsInputs extends StatelessWidget {
  const SettingsInputs(
      {super.key,
      required this.nameController,
      required this.emailController,
      required this.phoneController});

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;


  @override
  Widget build(BuildContext context) {
    nameController.text = UserData().getData(id: Keys.user)!.name!;
    emailController.text = UserData().getData(id: Keys.user)!.email!;
    phoneController.text = UserData().getData(id: Keys.user)!.phone!;
    return Column(
      children: [
        DefaultField(
          borderRadius: BorderRadius.zero,
          controller: nameController,
          hint: 'Name',
          isPassword: false,
          textInputType: TextInputType.text,
          validation: (value) {
            if (value.isEmpty) {
              return 'name required';
            }
          },
        ),
        SizedBox(height: 8.h),
        DefaultField(
          borderRadius: BorderRadius.zero,
          controller: emailController,
          hint: 'e-mail',
          isPassword: false,
          textInputType: TextInputType.text,
          validation: (value) {
            if (value.isEmpty) {
              return 'email required';
            }
          },
        ),
        SizedBox(height: 8.h),
        DefaultField(
          borderRadius: BorderRadius.zero,
          controller: phoneController,
          hint: 'Phone',
          isPassword: false,
          textInputType: TextInputType.text,
          validation: (value) {
            if (value.isEmpty) {
              return 'Phone required';
            }
          },
        ),
      ],
    );
  }
}
