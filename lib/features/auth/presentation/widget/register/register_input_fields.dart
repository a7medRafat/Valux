import 'package:flutter/material.dart';
import 'package:valux/config/Strings/app_strings.dart';
import '../../../../../config/style/icons_broken.dart';
import '../../../../../core/utils/default_text_field.dart';

class RegisterInputFields extends StatelessWidget {
  const RegisterInputFields(
      {super.key,
      required this.emailController,
      required this.passwordController,
      required this.nameController,
      required this.phoneController});

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultField(
            prefixIcon: const Icon(IconBroken.Profile),
            controller: nameController,
            hint: AppStrings.name,
            borderRadius: BorderRadius.circular(15),
            isPassword: false,
            textInputType: TextInputType.name,
            validation: (value) {
              if (value.isEmpty) {
                return AppStrings.validateName;
              }
            }),
        const SizedBox(height: 15),
        DefaultField(
            prefixIcon: const Icon(IconBroken.Message),
            controller: emailController,
            borderRadius: BorderRadius.circular(15),
            hint: AppStrings.email,
            isPassword: false,
            textInputType: TextInputType.emailAddress,
            validation: (value) {
              if (value.isEmpty) {
                return AppStrings.validateEmail;
              }
            }),
        const SizedBox(height: 15),
        DefaultField(
            prefixIcon: const Icon(IconBroken.Call),
            controller: phoneController,
            hint: AppStrings.phone,
            borderRadius: BorderRadius.circular(15),
            isPassword: false,
            textInputType: TextInputType.phone,
            validation: (value) {
              if (value.isEmpty) {
                return AppStrings.validatePhone;
              }
            }),
        const SizedBox(height: 15),
        DefaultField(
          prefixIcon: const Icon(IconBroken.Lock),
          controller: passwordController,
          hint: AppStrings.password,
          isPassword: false,
          borderRadius: BorderRadius.circular(15),
          textInputType: TextInputType.text,
          validation: (value) {
            if (value.isEmpty) {
              return AppStrings.validatePassword;
            }
          },
        ),
      ],
    );
  }
}
