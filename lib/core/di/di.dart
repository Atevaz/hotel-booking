import 'package:booking_hotel/business_logic/booking_cubit/booking_cubit.dart';
import 'package:booking_hotel/business_logic/business_logic.dart';
import 'package:booking_hotel/business_logic/hotels_cubit/hotels_cubit.dart';
import 'package:booking_hotel/core/dio_service/dio.dart';
import 'package:booking_hotel/core/network_service/network.dart';
import 'package:booking_hotel/core/shared_preferences/shared_preferences.dart';
import 'package:booking_hotel/data/local/auth/auth.dart';
import 'package:booking_hotel/data/remote/auth/auth.dart';
import 'package:booking_hotel/data/remote/booking/booking_data_source.dart';
import 'package:booking_hotel/data/remote/booking/booking_data_source_impl.dart';
import 'package:booking_hotel/data/remote/explore/explore.dart';
import 'package:booking_hotel/data/remote/hotels/hotels_data_source.dart';
import 'package:booking_hotel/data/remote/hotels/hotels_data_source_impl.dart';
import 'package:booking_hotel/data/repository/booking/repository_booking.dart';
import 'package:booking_hotel/data/repository/booking/repositroy_booking_impl.dart';
import 'package:booking_hotel/data/repository/explore/explore.dart';
import 'package:booking_hotel/data/repository/hotels/hotels_repository.dart';
import 'package:booking_hotel/data/repository/hotels/hotels_repository_impl.dart';
import 'package:booking_hotel/data/repository/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future initApp() async {
  Bloc.observer = MyBlocObserver();

  /// ui cubit
  sl.registerFactory(
    () => GlobalCubit(
      globalRepository: sl(),
    ),
  );
  sl.registerFactory(
    () => AuthCubit(
      authRepository: sl(),
    ),
  );
  sl.registerFactory(
    () => ExploreCubit(
      exploreRepository: sl(),
    ),
  );
  sl.registerFactory(
    () => BookingCubit(
      repositoryBooking: sl(),
    ),
  );
    sl.registerFactory(
    () => HotelsCubit(
      hotelsRepository: sl(),
    ),
  );

  /// repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      localAuth: sl(),
      remoteAuth: sl(),
      networkService: sl(),
    ),
  );
  sl.registerLazySingleton<GlobalRepository>(
    () => GlobalRepositoryImpl(
      helper: sl(),
    ),
  );
  sl.registerLazySingleton<ExploreRepository>(
    () => ExploreRepositoryImpl(
      exploreRemoteDataSource: sl(),
      networkService: sl(),
    ),
  );
  sl.registerLazySingleton<RepositoryBooking>(
    () => RepositoryBookingImpl(
      bookingDataSource: sl(),
      networkService: sl(),
    ),
  );
  sl.registerLazySingleton<HotelsRepository>(
    () => HotelsRepositoryImpl(
      hotelsDataSource: sl(),
      networkService: sl(),
    ),
  );

  /// others
  sl.registerLazySingleton<LocalAuthContract>(
    () => LocalAuthContractImpl(
      cacheHelper: sl(),
    ),
  );
  sl.registerLazySingleton<HotelsDataSource>(
    () => HotelsDataSourceImpl(
      dioService: sl(),
    ),
  );
  sl.registerLazySingleton<RemoteAuthDataSource>(
    () => RemoteAuthDataSourceImpl(
      dioService: sl(),
    ),
  );
  sl.registerLazySingleton<RemoteExploreDataSource>(
    () => RemoteExploreDataSourceImpl(
      dioService: sl(),
    ),
  );
  sl.registerLazySingleton<BookingDataSource>(
    () => BookingDataSourceImpl(
      dioService: sl(),
    ),
  );

  /// services
  sl.registerLazySingleton<PreferenceHelper>(
    () => PreferenceHelper(
      preferencesProvider: sl(),
    ),
  );
  sl.registerLazySingleton<DioService>(
    () => DioServiceImpl(
      dioProvider: sl(),
    ),
  );
  sl.registerLazySingleton<NetworkService>(
    () => NetworkServiceImpl(
      networkProvider: sl(),
    ),
  );

  /// providers
  sl.registerLazySingleton(
    () => SharedPreferencesProvider.instance,
  );
  sl.registerLazySingleton<DioProvider>(
    () => DioProvider.instance,
  );
  sl.registerLazySingleton<NetworkProvider>(
    () => NetworkProvider.instance,
  );
}
