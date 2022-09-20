import 'package:booking_hotel/presentation/screens/shared/auth_layout/login_screen.dart';
import 'package:booking_hotel/presentation/screens/shared/auth_layout/register_screen.dart';
import 'package:booking_hotel/presentation/screens/shared/filter_screen.dart';
import 'package:booking_hotel/presentation/screens/shared/home_layout/home_layout_screen.dart';
import 'package:booking_hotel/presentation/screens/shared/on_boarding.dart';
import 'package:booking_hotel/presentation/screens/shared/profile_layout/change_password_screen.dart';
import 'package:booking_hotel/presentation/screens/shared/profile_layout/profile_screen.dart';
import 'package:booking_hotel/presentation/test.dart';
import 'package:flutter/material.dart';
import 'app_router_names.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouterNames.rTestLayoutRoute:
        return MaterialPageRoute(
          builder: (_) => const FilterScreen(),
        );
      case AppRouterNames.rOnBoardingLayoutRoute:
        return MaterialPageRoute(
          builder: (_) => OnBoardingScreen(),
        );
      case AppRouterNames.rRegisterLayoutRoute:
        return MaterialPageRoute(
          builder: (_) => const RegisterScreen(),
        );
      case AppRouterNames.rLoginLayoutRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case AppRouterNames.rChangePasswordLayoutRoute:
        return MaterialPageRoute(
          builder: (_) => const ChangePasswordScreen(),
        );
      case AppRouterNames.rHomeLayoutRoute:
        return MaterialPageRoute(
          builder: (_) => const HomeLayoutScreen(),
        );
      default:
        return null;
    }
  }
}
