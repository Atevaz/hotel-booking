import 'package:booking_hotel/business_logic/auth_cubit/auth_cubit.dart';
import 'package:booking_hotel/business_logic/global_cubit/global_cubit.dart';
import 'package:booking_hotel/business_logic/global_cubit/global_state.dart';
import 'package:booking_hotel/business_logic/profile_cubit/profile_cubit.dart';
import 'package:booking_hotel/core/di/di.dart';
import 'package:booking_hotel/core/router/app_router.dart';
import 'package:booking_hotel/core/styles/constant.dart';
import 'package:booking_hotel/core/styles/themes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'business_logic/booking_cubit/booking_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initApp();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<GlobalCubit>()..initApp(),
        ),
        BlocProvider(
          create: (_) => sl<AuthCubit>()..loginSaved(),
        ),
        BlocProvider(
          create: (_) => sl<BookingCubit>()
            ..getUpcomingBooking()
            ..getCompletedBooking()
            ..getCancelledBooking(),
        ),
        BlocProvider(
          create: (_) => sl<ProfileCubit>()..getProfile(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, child) {
        return BlocConsumer<GlobalCubit, GlobalState>(
          listener: (context, state) {
            debugPrint("$state");
          },
          builder: (context, state) {
            final global = GlobalCubit.get(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateRoute: AppRouter.onGenerateRoute,
              theme: lightTheme,
              themeMode: appMode,
              darkTheme: darkTheme,
              locale: global.locale,
            );
          },
        );
      },
    );
  }
}
