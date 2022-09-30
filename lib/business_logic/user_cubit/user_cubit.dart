import 'package:booking_hotel/core/constants/error_messages.dart';
import 'package:booking_hotel/core/utils/string_extension.dart';
import 'package:booking_hotel/data/model/param_models/change_pass_param_model.dart';
import 'package:booking_hotel/data/model/param_models/login_param_model.dart';
import 'package:booking_hotel/data/model/param_models/profile_update_param_model.dart';
import 'package:booking_hotel/data/model/param_models/register_param_model.dart';
import 'package:booking_hotel/data/model/response_models/auth_response_model.dart';
import 'package:booking_hotel/data/model/user_model.dart';
import 'package:booking_hotel/data/repository/user/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository userRepository;
  bool isEng = true;
  UserModel? user;

  UserCubit({required this.userRepository}) : super(UserInitialState());

  static UserCubit get(BuildContext context) => BlocProvider.of(context);

  String path = '';
  final ImagePicker _picker = ImagePicker();

  void updateAppLang(bool isEnglish) {
    isEng = isEnglish;
    emit(UserInitialState());
  }

  Future pickImage(ImageSource source) async {
    final XFile? photo = await _picker.pickImage(source: source);
    if (photo != null) {
      path = photo.path;
      emit(PickImageSuccessState());
    }
  }

  Future getProfile() async {
    emit(GetProfileLoadingState());
    final result = await userRepository.getProfile(user!.token, isEng: isEng);
    result.fold(
      (l) {
        emit(GetProfileErrorState(l));
      },
      (r) {
        user = r.user;
        emit(GetProfileSuccessState());
      },
    );
  }

  Future changePassword({
    required String password,
    required String confirmedPassword,
    required String email,
  }) async {
    emit(ChangePasswordLoadingState());
    final param = ChangePasswordParamModel(
      token: user!.token,
      password: password,
      confirmationPassword: confirmedPassword,
      email: email,
    );
    final result = await userRepository.changePassword(param, isEng: isEng);
    result.fold(
      (l) {
        emit(ChangePasswordErrorState(l));
      },
      (r) {
        user = r.user;
        emit(ChangePasswordSuccessState(
            isEng ? r.status.enMessage : r.status.arMessage));
      },
    );
  }

  Future updateProfile({
    required String name,
    required String email,
    MultipartFile? image,
  }) async {
    emit(UpdateProfileLoadingState());
    if (email.isNotEmpty && !email.isValidEmail()) {
      emit(
        UpdateProfileErrorState(
          isEng ? Invalid_Email_Format_En_Err : Invalid_Email_Format_Ar_Err,
        ),
      );
      return;
    }
    final param = ProfileUpdateParamModel(
      token: user!.token,
      name: name,
      email: email,
      image: image,
    );
    final result = await userRepository.updateProfile(param, isEng: isEng);
    result.fold(
      (l) {
        emit(UpdateProfileErrorState(l));
      },
      (r) {
        user = r.user;
        path = '';
        emit(UpdateProfileSuccessState(
            isEng ? r.status.enMessage : r.status.arMessage));
      },
    );
  }

  Future loginSaved() async {
    emit(LoginSavedLoadingState());
    final result = await userRepository.loginSaved(isEng: isEng);
    result.fold(
      (l) {
        emit(LoginSavedLoadingErrorState(l));
      },
      (r) {
        user = r?.user;
        emit(LoginSavedLoadedState(r));
      },
    );
  }

  Future login(
    LoginParamModel paramModel,
    bool rememberMe,
  ) async {
    emit(LoginLoadingState());
    if (paramModel.email.isNotEmpty && !paramModel.email.isValidEmail()) {
      emit(
        LoginLoadingErrorState(
          isEng ? Invalid_Email_Format_En_Err : Invalid_Email_Format_Ar_Err,
        ),
      );
      return;
    }
    final result =
        await userRepository.login(paramModel, rememberMe, isEng: isEng);
    result.fold(
      (l) {
        emit(LoginLoadingErrorState(l));
      },
      (r) {
        user = r.user;
        emit(LoginLoadedState(r));
      },
    );
  }

  Future logout() async {
    emit(LogoutLoadingState());
    final result = await userRepository.logout(isEng: isEng);
    result.fold(
      (l) {
        emit(LogoutLoadingErrorState(l));
      },
      (r) {
        user = null;
        const logoutSuccessArMessage = 'تم تسجيل الخروج';
        const logoutSuccessEnMessage = 'You have logged out successfully';
        emit(LogoutLoadedState(
            isEng ? logoutSuccessEnMessage : logoutSuccessArMessage));
      },
    );
  }

  Future register(
    RegisterParamModel paramModel,
  ) async {
    emit(RegisterLoadingState());
    if (paramModel.email.isNotEmpty && !paramModel.email.isValidEmail()) {
      emit(
        RegisterLoadingErrorState(
          isEng ? Invalid_Email_Format_En_Err : Invalid_Email_Format_Ar_Err,
        ),
      );
      return;
    }
    final result = await userRepository.register(paramModel, isEng: isEng);
    result.fold(
      (l) {
        emit(RegisterLoadingErrorState(l));
      },
      (r) {
        emit(RegisterLoadedState(
            isEng ? r.status.enMessage : r.status.arMessage));
      },
    );
  }

  Future updateCachedUser(String? email, String? pass) async {
    emit(UpdateCachedUserLoadingState());
    final result = await userRepository.updateCachedUser(
      email: email,
      password: pass,
      isEng: isEng,
    );
    result.fold(
      (l) {
        emit(UpdateCachedUserLoadingErrorState(l));
      },
      (r) {
        emit(UpdateCachedUserLoadedState());
      },
    );
  }
}
