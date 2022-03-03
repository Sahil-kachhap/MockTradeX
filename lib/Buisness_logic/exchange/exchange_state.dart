part of 'exchange_bloc.dart';

@immutable
abstract class ExchangeState extends Equatable{}

class ExchangeInitial extends ExchangeState {
  @override
  
  List<Object?> get props => [];
}

class DataLoadedState extends ExchangeState{
  final List<Crypto> crypto;

  DataLoadedState(this.crypto);

  @override

  List<Object?> get props => [crypto];
}

class DataErrorState extends ExchangeState{
  final String error;

  DataErrorState(this.error);

  @override
  
  List<Object?> get props => [error];
}


