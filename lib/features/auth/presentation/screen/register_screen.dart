import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valux/core/go/go.dart';
import 'package:valux/core/utils/loading.dart';
import 'package:valux/core/utils/toast.dart';
import 'package:valux/features/auth/data/models/RegisterBody.dart';
import 'package:valux/features/auth/presentation/screen/login_screen.dart';
import 'package:valux/features/auth/presentation/widget/register/register_input_fields.dart';
import '../../../../App/injuctoin_container.dart';
import '../../../../config/colors/app_colors.dart';
import '../../../../core/utils/app_button.dart';
import '../../cubit/auth_cubit.dart';
import '../widget/register/register_text.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is UserRegisterSuccessStates) {
            if (state.model.status == true) {
              MyToast.show(text: state.model.message!, context: context);
              Go.goAndFinish(context, LoginScreen());
            } else {
              MyToast.show(text: state.model.message!, context: context);
            }
          } else if (state is UserRegisterErrorStates) {
            MyToast.show(text: state.error.toString(), context: context);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const RegisterText(),
                      const SizedBox(height: 30),
                      RegisterInputFields(
                          emailController: emailController,
                          passwordController: passwordController,
                          nameController: nameController,
                          phoneController: phoneController),
                      const SizedBox(height: 20),
                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          if (state is UserRegisterLoadingStates) {
                            return const Center(child: Loading());
                          }
                          return AppButton(
                              btnColor: AppColors.primaryColor,
                              txtColor: AppColors.vWhite,
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  RegisterBody model = RegisterBody(
                                      name: nameController.text,
                                      phone: phoneController.text,
                                      email: emailController.text,
                                      password: passwordController.text);
                                  sl<AuthCubit>().userRegister(body: model);
                                }
                              },
                              text: 'Sign Up');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}