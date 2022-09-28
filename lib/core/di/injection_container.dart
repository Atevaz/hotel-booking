import 'package:booking_hotel/core/dio_service/dio.dart';
import 'package:booking_hotel/core/network_service/network.dart';
import 'package:booking_hotel/core/shared_preferences/shared_preferences.dart';
import 'package:booking_hotel/business_logic/business_logic.dart';
import 'package:booking_hotel/data/repository/repository.dart';
import 'package:booking_hotel/data/local/user/user.dart';
import 'package:booking_hotel/data/remote/remote.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future initApp() async {
  Bloc.observer = MyBlocObserver();

  /// ui cubit
  serviceLocator.registerFactory(
    () => GlobalCubit(
      globalRepository: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => BookingCubit(
      bookingRepository: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => HotelCubit(
      hotelRepository: serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => UserCubit(
      userRepository: serviceLocator(),
    ),
  );

  /// repositories
  serviceLocator.registerLazySingleton<GlobalRepository>(
    () => GlobalRepositoryImpl(
      helper: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      localUserDataSource: serviceLocator(),
      userDataSource: serviceLocator(),
      networkService: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<BookingRepository>(
    () => BookingRepositoryImpl(
      bookingDataSource: serviceLocator(),
      networkService: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<HotelRepository>(
    () => HotelRepositoryImpl(
      hotelsDataSource: serviceLocator(),
      networkService: serviceLocator(),
    ),
  );

  /// others
  serviceLocator.registerLazySingleton<LocalUserDataSource>(
    () => LocalUserDataSourceImpl(
      cacheHelper: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<BookingDataSource>(
    () => BookingDataSourceImpl(
      dioService: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<HotelDataSource>(
    () => HotelDataSourceImpl(
      dioService: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<RemoteUserDataSource>(
    () => RemoteUserDataSourceImpl(
      dioService: serviceLocator(),
    ),
  );

  /// services
  serviceLocator.registerLazySingleton<PreferenceHelper>(
    () => PreferenceHelper(
      preferencesProvider: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<DioService>(
    () => DioServiceImpl(
      dioProvider: serviceLocator(),
    ),
  );
  serviceLocator.registerLazySingleton<NetworkService>(
    () => NetworkServiceImpl(
      networkProvider: serviceLocator(),
    ),
  );

  /// providers
  serviceLocator.registerLazySingleton(
    () => SharedPreferencesProvider.instance,
  );
  serviceLocator.registerLazySingleton<DioProvider>(
    () => DioProvider.instance,
  );
  serviceLocator.registerLazySingleton<NetworkProvider>(
    () => NetworkProvider.instance,
  );
}
