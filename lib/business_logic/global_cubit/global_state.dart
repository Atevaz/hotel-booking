
abstract class GlobalState {}

class GlobalInitial extends GlobalState {}

class GlobalChangePasswordVisibilityState extends GlobalState {}

class GlobalChangeConfirmPasswordVisibilityState extends GlobalState {}


class LogOutSuccessState  extends GlobalState {}

class LogOutErrorState extends GlobalState
{
  final String error;
  LogOutErrorState(this.error);
}

class AppChangeModeDarkState extends GlobalState {}

class AppChangeModeLightState extends GlobalState {}

class ChangeNavBarState extends GlobalState {}

class ShowThemeBottomSheet extends GlobalState {}

class CloseThemeBottomSheet extends GlobalState {}

class ChangeValueOfRadioButtonAndCloseBottomSheetState extends GlobalState {}

class ChangeStepOfStepperState extends GlobalState {}
