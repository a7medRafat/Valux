import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valux/config/colors/app_colors.dart';
import 'package:valux/core/shared_widgets/app_button.dart';
import 'package:valux/core/shared_widgets/loading.dart';
import 'package:valux/core/shared_widgets/toast.dart';
import 'package:valux/features/profile/cubit/profile_cubit.dart';
import 'package:valux/features/profile/presentation/widgets/change_pass/change_pass_inputs.dart';
import '../../../../App/injuctoin_container.dart';

class ChangePassScreen extends StatelessWidget {
  ChangePassScreen({super.key});

  final TextEditingController currentPassController = TextEditingController();

  final TextEditingController newPassController = TextEditingController();

  final TextEditingController reNewPassController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ChangePassSuccessState) {
            if (state.data.status == true) {
              MyToast.show(text: state.data.message!, context: context);
              currentPassController.clear();
              newPassController.clear();
              reNewPassController.clear();
              Navigator.pop(context);
            }
          }
          if (state is ChangePassErrorState) {
            MyToast.show(text: state.error, context: context);
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ChangePassInputs(
                      currentPassController: currentPassController,
                      newPassController: newPassController,
                      reNewPassController: reNewPassController),
                  BlocBuilder<ProfileCubit, ProfileState>(
                    builder: (context, state) {
                      if (state is ChangePassLoadingState) {
                        return const Center(child: Loading());
                      }
                      return AppButton(
                        function: () {
                          if (formKey.currentState!.validate()) {
                            if (newPassController.text ==
                                reNewPassController.text) {
                              sl<ProfileCubit>().changePass({
                                'current_password': currentPassController.text,
                                'new_password': newPassController.text,
                              });
                            } else {
                              MyToast.show(
                                  text: 'password isn\'t matches',
                                  context: context);
                            }
                          }
                        },
                        text: 'Change',
                        radius: BorderRadius.zero,
                        btnColor: AppColors.vBlue.withOpacity(0.8),
                        txtColor: AppColors.vWhite,
                      );
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
