part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitialState extends UserState {}

class GetProfileLoadingState extends UserState {}

class GetProfileSuccessState extends UserState {}

class GetProfileErrorState extends UserState {
  final String message;

  GetProfileErrorState(this.message);
}

class ChangePasswordLoadingState extends UserState {}

class ChangePasswordSuccessState extends UserState {
  final String message;

  ChangePasswordSuccessState(this.message);
}

class ChangePasswordErrorState extends UserState {
  final String message;

  ChangePasswordErrorState(this.message);
}

class UpdateProfileLoadingState extends UserState {}

class UpdateProfileSuccessState extends UserState {
  final String message;

  UpdateProfileSuccessState(this.message);
}

class UpdateProfileErrorState extends UserState {
  final String message;

  UpdateProfileErrorState(this.message);
}

class PickImageSuccessState extends UserState {}

class LoginSavedLoadingState extends UserState {}

class LoginSavedLoadedState extends UserState {
  final AuthResponseModel? responseModel;

  LoginSavedLoadedState(this.responseModel);
}

class LoginSavedLoadingErrorState extends UserState {
  final String message;

  LoginSavedLoadingErrorState(this.message);
}

class LoginLoadingState extends UserState {}

class LoginLoadedState extends UserState {
  final AuthResponseModel responseModel;

  LoginLoadedState(this.responseModel);
}

class LoginLoadingErrorState extends UserState {
  final String message;

  LoginLoadingErrorState(this.message);
}

class RegisterLoadingState extends UserState {}

class RegisterLoadedState extends UserState {
  final String message;

  RegisterLoadedState(this.message);
}

class RegisterLoadingErrorState extends UserState {
  final String message;

  RegisterLoadingErrorState(this.message);
}

class UpdateCachedUserLoadingState extends UserState {}

class UpdateCachedUserLoadedState extends UserState {}

class UpdateCachedUserLoadingErrorState extends UserState {
  final String message;

  UpdateCachedUserLoadingErrorState(this.message);
}

class LogoutLoadingState extends UserState {}

class LogoutLoadedState extends UserState {
  final String message;

  LogoutLoadedState(this.message);
}

class LogoutLoadingErrorState extends UserState {
  final String message;

  LogoutLoadingErrorState(this.message);
}
