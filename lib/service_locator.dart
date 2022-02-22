import 'package:get_it/get_it.dart';
import 'package:mock_tradex/Data/Models/crypto.dart';
import 'package:mock_tradex/Data/Repositories/crypto_repository.dart';

final getItInstance = GetIt.I;

void setup(){
  getItInstance.registerLazySingleton<CryptoRepository>(() => CryptoRepository());
}