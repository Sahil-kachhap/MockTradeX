import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mock_tradex/Data/Models/crypto.dart';
import 'package:mock_tradex/Data/Repositories/crypto_repository.dart';
part 'exchange_event.dart';
part 'exchange_state.dart';

class ExchangeBloc extends Bloc<ExchangeEvent, ExchangeState> {
  final CryptoRepository _cryptoRepository;

  ExchangeBloc(this._cryptoRepository) : super(ExchangeInitial()) {
    on<LoadApiDataEvent>((event, emit) async{
       try{
         final crypto = await _cryptoRepository.getCryptoCoins();
         emit(DataLoadedState(crypto));
       }catch(e){
         emit(DataErrorState(e.toString()));
         print(e);
       }
    });
  }
}
