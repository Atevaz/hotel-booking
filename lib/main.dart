import 'package:booking_hotel/business_logic/global_cubit/global_cubit.dart';
import 'package:booking_hotel/business_logic/global_cubit/global_state.dart';
import 'package:booking_hotel/core/router/app_router.dart';
import 'package:booking_hotel/core/router/app_router_names.dart';
import 'package:booking_hotel/core/styles/constant.dart';
import 'package:booking_hotel/core/styles/themes.dart';
import 'package:booking_hotel/presentation/view/hotel_details.dart';
import 'package:booking_hotel/presentation/view/last_search.dart';
import 'package:booking_hotel/presentation/view/update_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'business_logic/bloc_observer.dart';
import 'data/local/cache_helper.dart';
import 'data/remote/dio_helper.dart';

Future<void> main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  await CacheHelper.init();
  bool? isDark =
      CacheHelper.getDataFromSharedPreference(key: 'isDark') ?? false;
  runApp(MyApp(
    appRouter: AppRouter(),
    isDark: isDark,
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final bool? isDark;

  const MyApp({required this.appRouter, required this.isDark, Key? key})
      : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  GlobalCubit()..changeAppMode(fromCache: isDark),
            ),
          ],
          child: BlocConsumer<GlobalCubit, GlobalState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return MaterialApp(
                home: HotelDetails(),
                debugShowCheckedModeBanner: false,
                // initialRoute: AppRouterNames.rOnBoardingLayoutRoute,
                // onGenerateRoute: appRouter.onGenerateRoute,
                theme: lightTheme,
                themeMode: appMode,
                darkTheme: darkTheme,
              );
            },
          ),
        );
      },
    );
  }
}
