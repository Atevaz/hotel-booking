import 'package:bloc/bloc.dart';
import 'package:booking_hotel/core/constants/constant.dart';
import 'package:booking_hotel/data/models/auth_response/auth_response_model.dart';
import 'package:booking_hotel/data/models/auth_response/user_model.dart';
import 'package:booking_hotel/data/repository/profile/profile_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  late TextEditingController nameController ;
  late TextEditingController emailController ;

  ProfileRepository profileRepository ;
  ProfileCubit({required this.profileRepository}) : super(ProfileInitial()){
    nameController = TextEditingController(text: userModel?.user.name);
    emailController = TextEditingController(text: userModel?.user.email);
  }

  static ProfileCubit get(BuildContext context) => BlocProvider.of(context);
 String path = '';
  AuthResponseModel? userModel ;
  final ImagePicker _picker = ImagePicker();

  Future pickImage(ImageSource source)async{
    final XFile? photo =
        await _picker.pickImage(
        source: source);
    if(photo != null){
      path = photo.path;
      emit(PickImageSuccessState());
    }
  }
  Future getProfile() async {
    emit(GetProfileLoadingState());
    final result = await profileRepository.getProfile(token);
    result.fold(
          (l) {
        emit(GetProfileErrorState());
      },
          (r) {
        userModel = r ;
        debugPrint(' name come from user model  ${userModel!.user.name}');
        emit(GetProfileSuccessState());
      },
    );
  }

  Future changePassword({required String password ,required String confirmedPassword ,required String email }) async {
    emit(ChangePasswordLoadingState());
    final result = await profileRepository.changePassword(password,confirmedPassword,email);
    result.fold(
          (l) {
        emit(ChangePasswordErrorState());
      },
          (r) {
        userModel = r ;
        emit(ChangePasswordSuccessState());
      },
    );
  }
  Future updateProfile({required String name,required String email,  MultipartFile? image }) async {
    emit(UpdateProfileLoadingState());
    final result = await profileRepository.updateProfile(name,email,image);
    result.fold(
          (l) {
        emit(UpdateProfileErrorState());
      },
          (r) {
        userModel = r ;
        path = '';
        emit(UpdateProfileSuccessState());
      },
    );
  }

}
