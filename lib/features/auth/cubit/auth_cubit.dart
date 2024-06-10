import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valux/config/style/icons_broken.dart';
import 'package:valux/features/auth/data/models/LoginModel.dart';
import 'package:valux/features/auth/data/models/RegisterModel.dart';
import 'package:valux/features/auth/domain/usecases/user_register_usecase.dart';
import 'package:valux/features/profile/cubit/profile_cubit.dart';
import '../../../App/injuctoin_container.dart';
import '../data/models/RegisterBody.dart';
import '../domain/usecases/user_login_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final UserLoginUseCase userLoginUseCase;
  final UserRegisterUseCase userRegisterUseCase;

  AuthCubit({
    required this.userLoginUseCase,
    required this.userRegisterUseCase,
  }) : super(AuthInitial());

  void userLogin({required String email, required String password}) async {
    emit(UserLoginLoadingStates());
    final failureOrSuccess =
        await userLoginUseCase.call(email: email, password: password);
    failureOrSuccess.fold(
        (failure) => emit(UserLoginErrorStates(error: failure.getMessage())),
        (success) async{
          if(success.status == true){
            await sl<ProfileCubit>().getProfileData(token: success.data!.token!);
          }
      emit(UserLoginSuccessStates(loginModel: success));
    });
  }

  void userRegister({required RegisterBody body}) async {
    emit(UserRegisterLoadingStates());
    final failureOrSuccess = await userRegisterUseCase.call(body: body);
    failureOrSuccess.fold(
        (failure) => emit(UserRegisterErrorStates(error: failure.getMessage())),
        (success) {
      emit(UserRegisterSuccessStates(model: success));
    });
  }

  bool isVisible = true;
  IconData suffix = IconBroken.Show;

  void changeVisibility() {
    isVisible = !isVisible;
    suffix = isVisible ? IconBroken.Show : IconBroken.Hide;
    emit(AppChangeVisibilityStates());
  }
}
