part of 'authentication_bloc_bloc.dart';
//defines differnt auth states 
// defines states that the bloc can be in . Different states of my bloc

Enum AuthenticationStatus { authenticated, unauthenticated, UnknownElement }

class AuthenticationState extends Equatable{
//holds the authenication status wich is one of the three options
  final AuthenticationStatus status;
  final user? user;
//initializes with default values
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user,
  });

  const AuthenticationState.unkown() : this._();

  const AuthenticationState.authenticated(user user) : this._(status: AuthenticationStatus.authenticated, user: user);
  const AuthenticationState.unauthenticated() : this._(status: AuthenticationStatus.unauthenticated, user: user);




  @override
  List<Object?> get props => [status, user];
  
}