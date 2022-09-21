// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkProvider {
  static final _instance = NetworkProvider._internal();

  static NetworkProvider get instance => _instance;
  bool isInitialized = false;
  late InternetConnectionChecker _connectionChecker;

  NetworkProvider._internal();

  InternetConnectionChecker get() {
    if (!isInitialized) init();
    return _connectionChecker;
  }

  void init() {
    _connectionChecker = InternetConnectionChecker();
    isInitialized = true;
  }
}
