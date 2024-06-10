part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AppInitialStates extends AuthState {}

class UserLoginLoadingStates extends AuthState {}

class UserLoginSuccessStates extends AuthState {
  final LoginModel loginModel;

  UserLoginSuccessStates({required this.loginModel});
}

class UserLoginErrorStates extends AuthState {
  final String error;

  UserLoginErrorStates({required this.error});
}

class AppChangeVisibilityStates extends AuthState {}

class UserRegisterLoadingStates extends AuthState {}

class UserRegisterSuccessStates extends AuthState {
  final RegisterModel model;

  UserRegisterSuccessStates({required this.model});
}

class UserRegisterErrorStates extends AuthState {
  final String error;

  UserRegisterErrorStates({required this.error});
}

class AppRegisterChangeVisibilityStates extends AuthState {}

class FirebaseLoginSuccessStates extends AuthState {}

class FirebaseLoginErrorStates extends AuthState {}
class FirebaseLoginLoadingStates extends AuthState {}

