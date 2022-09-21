import 'package:booking_hotel/presentation/screens/shared/home_layout/home_layout_screen.dart';
import 'package:booking_hotel/presentation/screens/shared/on_boarding.dart';
import 'package:booking_hotel/presentation/screens/shared/splash_screen.dart';

import 'package:booking_hotel/presentation/screens/user/auth_layout/login_screen.dart';
import 'package:booking_hotel/presentation/screens/user/auth_layout/register_screen.dart';
import 'package:booking_hotel/presentation/screens/user/explore_screen.dart';
import 'package:booking_hotel/presentation/screens/user/filter_screen.dart';
import 'package:booking_hotel/presentation/screens/user/home_screen.dart';
import 'package:booking_hotel/presentation/screens/user/hotel_details.dart';
import 'package:booking_hotel/presentation/screens/user/search_map.dart';
import 'package:booking_hotel/presentation/screens/user/profile_layout/update_profile.dart';
import 'package:flutter/material.dart';
import 'app_router_names.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouterNames.rSplashLayoutRoute:
        return MaterialPageRoute(
          builder: (_) => OnBoardingScreen(),
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
      // case AppRouterNames.rChangePasswordLayoutRoute:
      //   return MaterialPageRoute(
      //     builder: (_) => const ChangePasswordScreen(),
      //   );
      case AppRouterNames.rHomeLayoutRoute:
        return MaterialPageRoute(
          builder: (_) => const HomeLayoutScreen(),
        );
      case AppRouterNames.rExploreLayoutRoute:
        return MaterialPageRoute(
          builder: (_) => const ExploreScreen(),
        );
      case AppRouterNames.rUpdateProfileLayoutRoute:
        return MaterialPageRoute(
          builder: (_) => const UpdateProfile(),
        );
      case AppRouterNames.rSearchMapLayoutRoute:
        return MaterialPageRoute(
          builder: (_) => const SearchMapScreen(),
        );
      case AppRouterNames.rFilterLayoutRoute:
        return MaterialPageRoute(
          builder: (_) => const FilterScreen(),
        );
      case AppRouterNames.rHotelDetailsLayoutRoute:
        return MaterialPageRoute(
          builder: (_) => const HotelDetails(),
        );
      default:
        return null;
    }
  }
}
