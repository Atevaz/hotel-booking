import 'network.dart';

class NetworkServiceImpl implements NetworkService {
  @override
  NetworkProvider networkProvider;

  NetworkServiceImpl({
    required this.networkProvider,
  });

  @override
  Future<bool> get isConnected async =>
      await networkProvider.get().hasConnection;
}
