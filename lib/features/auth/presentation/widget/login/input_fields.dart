import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valux/features/auth/cubit/auth_cubit.dart';
import '../../../../../App/injuctoin_container.dart';
import '../../../../../config/style/icons_broken.dart';
import '../../../../../core/utils/default_text_field.dart';

class LoginInputFields extends StatelessWidget {
  const LoginInputFields(
      {super.key,
      required this.emailController,
      required this.passwordController});

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultField(
            prefixIcon: const Icon(IconBroken.Message),
            controller: emailController,
            hint: 'Email address',
            isPassword: false,
            borderRadius: BorderRadius.circular(15),
            textInputType: TextInputType.text,
            validation: (value) {
              if (value.isEmpty) {
                return 'password must not be empty';
              }
            }),
        const SizedBox(height: 15),
        BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {},
          builder: (context, state) {
            return DefaultField(
                prefixIcon: const Icon(IconBroken.Lock),
                suffixPressed: () {
                  sl<AuthCubit>().changeVisibility();
                },
                suffixIcon: sl<AuthCubit>().suffix,
                controller: passwordController,
                hint: 'Password',
                borderRadius: BorderRadius.circular(15),
                isPassword: sl<AuthCubit>().isVisible,
                textInputType: TextInputType.visiblePassword,
                validation: (value) {
                  if (value.isEmpty) {
                    return 'password must not be empty';
                  }
                });
          },
        ),
      ],
    );
  }
}
