part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginLoadedState extends LoginState {}

class LoginLoadingErrorState extends LoginState {
  final String message;

  LoginLoadingErrorState(this.message);
}
