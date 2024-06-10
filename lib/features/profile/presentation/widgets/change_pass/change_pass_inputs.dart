import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/default_text_field.dart';

class ChangePassInputs extends StatelessWidget {
  const ChangePassInputs(
      {super.key,
      required this.currentPassController,
      required this.newPassController,
      required this.reNewPassController});

  final TextEditingController currentPassController;

  final TextEditingController newPassController;

  final TextEditingController reNewPassController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultField(
          borderRadius: BorderRadius.zero,
          controller: currentPassController,
          hint: 'Current Password',
          isPassword: false,
          textInputType: TextInputType.text,
          validation: (value) {
            if (value.isEmpty) {
              return 'current password required';
            }
          },
        ),
        SizedBox(height: 8.h),
        DefaultField(
          borderRadius: BorderRadius.zero,
          controller: newPassController,
          hint: 'New Password',
          isPassword: false,
          textInputType: TextInputType.text,
          validation: (value) {
            if (value.isEmpty) {
              return 'New Password required';
            }
          },
        ),
        SizedBox(height: 8.h),
        DefaultField(
          borderRadius: BorderRadius.zero,
          controller: reNewPassController,
          hint: 'Re-type password',
          isPassword: false,
          textInputType: TextInputType.text,
          validation: (value) {
            if (value.isEmpty) {
              return 'Field required';
            }
          },
        ),
        SizedBox(height: 15.h),
      ],
    );
  }
}
