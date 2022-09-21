import 'package:booking_hotel/core/constants/end_points.dart';
import 'package:dio/dio.dart';

class DioProvider {
  static final DioProvider _instance = DioProvider._internal();

  static DioProvider get instance => _instance;
  bool _initialized = false;
  late Dio dio;

  DioProvider._internal();

  Dio get() {
    if (!_initialized) _init();
    return dio;
  }

  void _init() {
    dio = Dio(
      BaseOptions(
        baseUrl: '$baseApiUrl$version',
        receiveDataWhenStatusError: true,
        connectTimeout: 5000,
      ),
    );
    _initialized = true;
  }
}
