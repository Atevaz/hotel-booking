import 'package:booking_hotel/core/shared_preferences/preference_helper.dart';
import 'package:booking_hotel/data/model/param_models/login_param_model.dart';

abstract class LocalUserDataSource{
  late PreferenceHelper cacheHelper;

  Future<void> cacheUser({
    required String userData,
  });

  Future<void> removeUser();

  Future<LoginParamModel?> getUser();
}