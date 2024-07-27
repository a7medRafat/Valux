import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:valux/core/local_storage/user_storage.dart';
import 'package:valux/core/utils/linear_loading.dart';
import 'package:valux/core/shared_widgets/toast.dart';
import 'package:valux/features/profile/cubit/profile_cubit.dart';
import '../../../../App/injuctoin_container.dart';
import '../../../../core/local_storage/hive_keys.dart';
import '../widgets/change_password.dart';
import '../widgets/image.dart';
import '../widgets/info.dart';
import '../widgets/settings_inputs.dart';
import '../widgets/update_btn.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is UpdateUserSuccessState) {
            MyToast.show(text: state.data.message!, context: context);
            sl<ProfileCubit>().removePickedImg();
          }
          if (state is UpdateUserErrorState) {
            MyToast.show(text: state.error, context: context);
          }
          if (state is UploadImgSuccessState) {
            sl<ProfileCubit>().pickedImg = null;
            MyToast.show(text: state.msg, context: context);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ProfileImage(
                      pickImg: () => sl<ProfileCubit>().getProfileImg(),
                      function: () async {
                        sl<ProfileCubit>().updateUser(
                          {
                            'name': UserData().getData(id: Keys.user)!.name!,
                            'email': UserData().getData(id: Keys.user)!.email!,
                            'phone': UserData().getData(id: Keys.user)!.phone!,
                            'image': await sl<ProfileCubit>()
                                .encodeImageToBase64(
                                    sl<ProfileCubit>().pickedImg!),
                          },
                        );
                      },
                    ),
                    if (state is UpdateUserLoadingState ||
                        state is UploadImgLoadingState)
                      const LinearLoading(),
                    SizedBox(height: 20.h),
                    const Info(),
                    SettingsInputs(
                      nameController: nameController,
                      emailController: emailController,
                      phoneController: phoneController,
                    ),
                    UpdateButton(
                      function: () async {
                        if (formKey.currentState!.validate()) {
                          sl<ProfileCubit>().updateUser(
                            {
                              'name': nameController.text,
                              'email': emailController.text,
                              'phone': phoneController.text,
                              'image':
                                  UserData().getData(id: Keys.user)!.image!,
                            },
                          );
                        }
                      },
                    ),
                    const ChangePassword(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
