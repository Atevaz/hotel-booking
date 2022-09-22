part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class ErrorState extends AuthState {
  final String message;

  ErrorState(this.message);
}

class AuthInitial extends AuthState {}

class LoginSavedLoadingState extends AuthState {}

class LoginSavedLoadedState extends AuthState {
  final AuthResponseModel responseModel;

  LoginSavedLoadedState(this.responseModel);
}

class LoginSavedLoadingErrorState extends ErrorState {
  LoginSavedLoadingErrorState(super.message);
}

class LoginLoadingState extends AuthState {}

class LoginLoadedState extends AuthState {
  final AuthResponseModel responseModel;

  LoginLoadedState(this.responseModel);
}

class LoginLoadingErrorState extends ErrorState {
  LoginLoadingErrorState(super.message);
}

class RegisterLoadingState extends AuthState {}

class RegisterLoadedState extends AuthState {}

class RegisterLoadingErrorState extends ErrorState {
  RegisterLoadingErrorState(super.message);
}

class LogoutLoadingState extends AuthState {}

class LogoutLoadedState extends AuthState {}

class LogoutLoadingErrorState extends ErrorState {
  LogoutLoadingErrorState(super.message);
}
