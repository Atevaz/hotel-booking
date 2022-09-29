part of 'global_cubit.dart';

@immutable
abstract class GlobalState {}

class GlobalInitialState extends GlobalState {}

class GlobalChangePasswordVisibilityState extends GlobalState {}

class GlobalChangeConfirmPasswordVisibilityState extends GlobalState {}

class LogOutSuccessState extends GlobalState {}

class LogOutErrorState extends GlobalState {
  final String error;

  LogOutErrorState(this.error);
}

class AppChangeModeDarkState extends GlobalState {}

class AppChangeModeLightState extends GlobalState {}

class AppModeSavedState extends GlobalState {}

class AppModeSaveErrorState extends GlobalState {
  final String message;

  AppModeSaveErrorState(this.message);
}

class AppChangeLocaleArabicState extends GlobalState {}

class AppChangeLocaleEnglishState extends GlobalState {}

class AppLocaleSavedState extends GlobalState {}

class AppLocaleSaveErrorState extends GlobalState {
  final String message;

  AppLocaleSaveErrorState(this.message);
}

class ChangeNavBarState extends GlobalState {}

class ShowThemeBottomSheet extends GlobalState {}

class CloseThemeBottomSheet extends GlobalState {}

class ChangeValueOfRadioButtonAndCloseBottomSheetState extends GlobalState {}

class ChangeStepOfStepperState extends GlobalState {}
