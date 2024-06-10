import 'package:flutter/material.dart';
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
            prefixIcon: const Icon(IconBroken.User1),
            controller: nameController,
            hint: 'Name',
            borderRadius: BorderRadius.circular(15),
            isPassword: false,
            textInputType: TextInputType.name,
            validation: (value) {
              if (value.isEmpty) {
                return 'name must not be empty';
              }
            }),
        const SizedBox(height: 15),
        DefaultField(
            prefixIcon: const Icon(IconBroken.Message),
            controller: emailController,
            borderRadius: BorderRadius.circular(15),
            hint: 'E-mail',
            isPassword: false,
            textInputType: TextInputType.emailAddress,
            validation: (value) {
              if (value.isEmpty) {
                return 'email must not be empty';
              }
            }),
        const SizedBox(height: 15),
        DefaultField(
            prefixIcon: const Icon(IconBroken.Call),
            controller: phoneController,
            hint: 'Phone number',
            borderRadius: BorderRadius.circular(15),
            isPassword: false,
            textInputType: TextInputType.phone,
            validation: (value) {
              if (value.isEmpty) {
                return 'phone must not be empty';
              }
            }),
        const SizedBox(height: 15),
        DefaultField(
            prefixIcon: const Icon(IconBroken.Lock),
            controller: passwordController,
            hint: 'password',
            isPassword: false,
            borderRadius: BorderRadius.circular(15),
            textInputType: TextInputType.text,
            validation: (value) {
              if (value.isEmpty) {
                return 'password must not be empty';
              }
            }),
      ],
    );
  }
}
