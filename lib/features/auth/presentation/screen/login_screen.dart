import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valux/core/go/go.dart';
import 'package:valux/core/utils/app_button.dart';
import 'package:valux/core/utils/loading.dart';
import 'package:valux/core/utils/toast.dart';
import 'package:valux/features/auth/presentation/widget/login/input_fields.dart';
import 'package:valux/features/layout/presentation/screens/app_layout.dart';
import 'package:valux/features/profile/cubit/profile_cubit.dart';
import '../../../../App/injuctoin_container.dart';
import '../../../../config/colors/app_colors.dart';
import '../../../layout/cubit/home/home_cubit.dart';
import '../../cubit/auth_cubit.dart';
import '../widget/login/login_text.dart';
import '../widget/login/register_now.dart';

class LoginScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (BuildContext context, state) async {
        if (state is UserLoginSuccessStates) {
          if (state.loginModel.status == true) {
            sl<ProfileCubit>().getProfileData(token: state.loginModel.data!.token!);
            sl<HomeCubit>().getHomeData();
            Go.goAndFinish(context, const AppLayout());
          } else {
            MyToast.show(text: state.loginModel.message!, context: context);
          }
        }
      },
      builder: (BuildContext context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LoginText(),
                      const SizedBox(height: 30),
                      LoginInputFields(
                          emailController: emailController,
                          passwordController: passwordController),
                      const SizedBox(height: 30),
                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          if (state is UserLoginLoadingStates) {
                            return const Center(child: Loading());
                          }
                          return AppButton(
                              btnColor: AppColors.primaryColor,
                              txtColor: AppColors.vWhite,
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  sl<AuthCubit>().userLogin(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                              text: 'Sign In');
                        },
                      ),
                      const RegisterNow()
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
