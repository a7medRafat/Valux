part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class SettingInitial extends ProfileState {}

class UpdateUserLoadingState extends ProfileState {}

class UpdateUserSuccessState extends ProfileState {
  final UpdateProfileModel data;

  UpdateUserSuccessState({required this.data});
}

class UpdateUserErrorState extends ProfileState {
  final String error;

  UpdateUserErrorState({required this.error});
}

class ChangePassLoadingState extends ProfileState {}

class ChangePassSuccessState extends ProfileState {
  final ChangePasswordModel data;

  ChangePassSuccessState({required this.data});
}

class ChangePassErrorState extends ProfileState {
  final String error;

  ChangePassErrorState({required this.error});
}

class UploadImgLoadingState extends ProfileState {}

class UploadImgSuccessState extends ProfileState {
  final String msg;

  UploadImgSuccessState({required this.msg});
}

class UploadImgErrorState extends ProfileState {
  final String error;

  UploadImgErrorState({required this.error});
}

class PickProfileImageLoadingState extends ProfileState {}

class ProfilePickedSuccessState extends ProfileState {}

class ProfilePickedErrorState extends ProfileState {}

class GetProfileLoadingState extends ProfileState {}

class GetProfileSuccessState extends ProfileState {
  final ProfileData data;

  GetProfileSuccessState({required this.data});
}

class GetProfileErrorState extends ProfileState {}

class GetProfileImageSuccessState extends ProfileState {}

class RemovePickedImgState extends ProfileState{}
