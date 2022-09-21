import 'network_provider.dart';

abstract class NetworkService {
  late NetworkProvider networkProvider;

  Future<bool> get isConnected;
}
