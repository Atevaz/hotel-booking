part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class GetProfileLoadingState extends ProfileState {}
class GetProfileSuccessState extends ProfileState {}
class GetProfileErrorState extends ProfileState {}

class ChangePasswordLoadingState extends ProfileState {}
class ChangePasswordSuccessState extends ProfileState {}
class ChangePasswordErrorState extends ProfileState {}

class UpdateProfileLoadingState extends ProfileState {}
class UpdateProfileSuccessState extends ProfileState {}
class UpdateProfileErrorState extends ProfileState {}
class PickImageSuccessState extends ProfileState {}

