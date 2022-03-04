part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {}

class Loading extends AuthState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class Authenticated extends AuthState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class UnAuthenticated extends AuthState{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AuthError extends AuthState{
  final String Error;

  AuthError(this.Error);
  
  @override
  // TODO: implement props
  List<Object?> get props => [Error];
}


