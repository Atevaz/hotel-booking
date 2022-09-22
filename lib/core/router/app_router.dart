import 'package:booking_hotel/data/models/hotel_search_models_response/facility_model.dart';
import 'package:booking_hotel/presentation/screens/shared/home_layout/home_layout_screen.dart';
import 'package:booking_hotel/presentation/screens/shared/on_boarding.dart';
import 'package:booking_hotel/presentation/screens/user/auth_layout/login_screen.dart';
import 'package:booking_hotel/presentation/screens/user/auth_layout/register_screen.dart';
import 'package:booking_hotel/presentation/screens/user/explore_layout_screen.dart';
import 'package:booking_hotel/presentation/screens/user/filter_screen.dart';
import 'package:booking_hotel/presentation/screens/user/hotel_details.dart';
import 'package:booking_hotel/presentation/screens/user/profile_layout/update_profile.dart';
import 'package:flutter/material.dart';
import 'app_router_names.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouterNames.rSplashLayoutRoute:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      case AppRouterNames.rOnBoardingLayoutRoute:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
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
          builder: (_) => const ExploreLayoutScreen(),
        );
      case AppRouterNames.rUpdateProfileLayoutRoute:
        return MaterialPageRoute(
          builder: (_) => const UpdateProfile(),
        );
      case AppRouterNames.rFilterLayoutRoute:
        final result = settings.arguments as List<FacilityModel>?;
        return MaterialPageRoute(
          builder: (_) => FilterScreen(
            facilities: result ?? [],
          ),
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
