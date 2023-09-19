part of 'authentication_bloc_bloc.dart';

//this defines events that the bloc will respond to . intiate change in the state
@immutable
abstract class AuthenticationBlocEvent extends Equatable {
  const AuthenticationBlocEvent();

  @override
  List<Object> get props => [];

  get user => null;
}

class AuthenticationUserChanged extends AuthenticationBlocEvent {
  const AuthenticationUserChanged(this.user);

  final Myuser? user;
}
