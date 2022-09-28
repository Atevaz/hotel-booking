import 'package:booking_hotel/core/di/injection_container.dart';
import 'package:booking_hotel/core/router/app_router.dart';
import 'package:booking_hotel/core/styles/themes.dart';
import 'package:booking_hotel/business_logic/business_logic.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initApp();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => serviceLocator<GlobalCubit>()..initApp(),
          lazy: false,
        ),
        BlocProvider(
          create: (_) => serviceLocator<UserCubit>()..loginSaved(),
          lazy: false,
        ),
        BlocProvider(
          create: (_) => serviceLocator<HotelCubit>(),
        ),
        BlocProvider(
          create: (_) => serviceLocator<BookingCubit>(),
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
        return BlocBuilder<GlobalCubit, GlobalState>(
          builder: (context, state) {
            final global = GlobalCubit.get(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateRoute: AppRouter.onGenerateRoute,
              theme: lightTheme,
              themeMode: global.appMode,
              darkTheme: darkTheme,
              locale: global.locale,
            );
          },
        );
      },
    );
  }
}
