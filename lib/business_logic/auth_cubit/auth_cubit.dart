import 'package:booking_hotel/core/constants/constant.dart';
import 'package:booking_hotel/core/utils/string_extension.dart';
import 'package:booking_hotel/data/models/auth_params/login_param_model.dart';
import 'package:booking_hotel/data/models/auth_params/register_param_model.dart';
import 'package:booking_hotel/data/models/auth_response/auth_response_model.dart';
import 'package:booking_hotel/data/models/auth_response/user_model.dart';
import 'package:booking_hotel/data/repository/auth/repository_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;
  UserModel? user;

  AuthCubit({required this.authRepository}) : super(AuthInitial());

  static AuthCubit get(BuildContext context) => BlocProvider.of(context);

  Future loginSaved() async {
    emit(LoginSavedLoadingState());
    final result = await authRepository.loginSaved();
    result.fold(
      (l) {
        emit(LoginSavedLoadingErrorState(l));
      },
      (r) {
        user = r.user;
        token = r.user.token ;
        emit(LoginSavedLoadedState(r));
      },
    );
  }

  Future login(LoginParamModel paramModel, bool rememberMe) async {
    emit(LoginLoadingState());
    if (!paramModel.email.isValidEmail()) {
      emit(LoginLoadingErrorState("Invalid email format!ad"));
      return;
    }
    final result = await authRepository.login(paramModel, rememberMe);
    result.fold(
      (l) {
        emit(LoginLoadingErrorState(l));
      },
      (r) {
        user = r.user;
        token = r.user.token ;
        emit(LoginLoadedState(r));
      },
    );
  }

  Future logout() async {
    emit(LogoutLoadingState());
    final result = await authRepository.logout();
    result.fold(
      (l) {
        emit(LogoutLoadingErrorState(l));
      },
      (r) {
        user = null;
        emit(LogoutLoadedState());
      },
    );
  }

  Future register(RegisterParamModel paramModel) async {
    emit(RegisterLoadingState());
    if (!paramModel.email.isValidEmail()) {
      emit(LoginLoadingErrorState("Invalid email format!ad"));
      return;
    }
    final result = await authRepository.register(paramModel);
    result.fold(
      (l) {
        emit(RegisterLoadingErrorState(l));
      },
      (r) {
        emit(RegisterLoadedState());
      },
    );
  }
}
