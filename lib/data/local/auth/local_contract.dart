import 'package:booking_hotel/core/shared_preferences/preference_helper.dart';
import 'package:booking_hotel/data/models/auth_params/login_param_model.dart';

abstract class LocalAuthContract {
  late PreferenceHelper cacheHelper;

  Future<void> cacheUser({
    required String userData,
  });

  Future<void> removeUser();

  Future<LoginParamModel> getUser();
}
