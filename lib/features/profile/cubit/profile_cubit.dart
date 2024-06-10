import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:valux/features/profile/data/models/ChangePasswordModel.dart';
import 'package:valux/features/profile/data/models/UpdateProfileModel.dart';
import 'package:valux/features/profile/domain/usecases/change_pass_usecase.dart';
import 'package:valux/features/profile/domain/usecases/get_profile_data_usecase.dart';
import '../../../core/local_storage/hive_keys.dart';
import '../../../core/local_storage/user_storage.dart';
import '../data/models/GetProfileModel.dart';
import '../domain/usecases/update_user_usecase.dart';

part 'setting_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final UpdateUserUseCase updateUserUseCase;
  final ChangePassUseCase changePassUseCase;
  final GetProfileDataUseCase getProfileDataUseCase;

  ProfileCubit({
    required this.updateUserUseCase,
    required this.changePassUseCase,
    required this.getProfileDataUseCase,
  }) : super(SettingInitial());

  void updateUser(Map<String, dynamic> map) async {
    emit(UpdateUserLoadingState());
    final failureOrSuccess = await updateUserUseCase.call(map: map);
    failureOrSuccess.fold(
        (failure) => emit(UpdateUserErrorState(error: failure.getMessage())),
        (success) {
      emit(UpdateUserSuccessState(data: success));
    });
  }

  void changePass(Map<String, dynamic> map) async {
    emit(ChangePassLoadingState());
    final failureOrSuccess = await changePassUseCase.call(map: map);
    failureOrSuccess.fold(
        (failure) => emit(ChangePassErrorState(error: failure.getMessage())),
        (success) {
      emit(ChangePassSuccessState(data: success));
    });
  }

  var picker = ImagePicker();
  File? pickedImg;

  void removePickedImg() {
    pickedImg = null;
    emit(RemovePickedImgState());
  }

  Future<void> getProfileImg() async {
    emit(PickProfileImageLoadingState());
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      pickedImg = File(pickedFile.path);
      emit(ProfilePickedSuccessState());
    } else {
      print('no img selected');
      emit(ProfilePickedErrorState());
    }
  }

  Future<String?> encodeImageToBase64(File imageFile) async {
    try {
      final bytes = await imageFile.readAsBytes();
      return base64Encode(bytes);
    } catch (e) {
      print("Error encoding image: $e");
      return null;
    }
  }

  Future getProfileData({required String token}) async {
    emit(GetProfileLoadingState());
    final failureOrSuccess = await getProfileDataUseCase.call(token: token);
    failureOrSuccess.fold((failure) => emit(GetProfileErrorState()),
        (success) async {
      emit(GetProfileSuccessState(data: UserData().getData(id: Keys.user)!));
    });
  }
}
