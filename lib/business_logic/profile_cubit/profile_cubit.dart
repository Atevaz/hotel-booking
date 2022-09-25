import 'package:bloc/bloc.dart';
import 'package:booking_hotel/core/constants/constant.dart';
import 'package:booking_hotel/data/models/auth_response/auth_response_model.dart';
import 'package:booking_hotel/data/models/auth_response/user_model.dart';
import 'package:booking_hotel/data/repository/profile/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {

  ProfileRepository profileRepository ;
  ProfileCubit({required this.profileRepository}) : super(ProfileInitial());

  static ProfileCubit get(BuildContext context) => BlocProvider.of(context);

  AuthResponseModel? userModel ;

  Future getProfile() async {
    emit(GetProfileLoadingState());
    final result = await profileRepository.getProfile('B4qRJI8wDJZ3aySpTsNeej938RVHnz3wYbn5N8ANqNUk25hELoXqA1ZXLVPO');
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

}
