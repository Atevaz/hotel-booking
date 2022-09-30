import 'package:booking_hotel/core/di/injection_container.dart';
import 'package:booking_hotel/core/router/app_router.dart';
import 'package:booking_hotel/core/styles/themes.dart';
import 'package:booking_hotel/business_logic/business_logic.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initApp();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
      path: 'assets/i18n',
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => serviceLocator<GlobalCubit>()..initApp(),
          ),
          BlocProvider(
            create: (_) => serviceLocator<UserCubit>(),
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
            if (state is AppLocaleSavedState) {
              context.setLocale(GlobalCubit.get(context).locale);
              final isEng = GlobalCubit.get(context).isEng;
              UserCubit.get(context).updateAppLang(isEng);
              BookingCubit.get(context).updateAppLang(isEng);
              HotelCubit.get(context).updateAppLang(isEng);
            }
          },
          builder: (context, state) {
            final global = GlobalCubit.get(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateRoute: AppRouter.onGenerateRoute,
              theme: lightTheme,
              themeMode: global.appMode,
              darkTheme: darkTheme,
              locale: context.locale,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
            );
          },
        );
      },
    );
  }
}
