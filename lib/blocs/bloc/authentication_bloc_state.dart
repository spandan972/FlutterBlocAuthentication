part of 'authentication_bloc_bloc.dart';
//defines differnt auth states
// defines states that the bloc can be in . Different states of my bloc

enum authenticationStatus { authenticated, unauthenticated, unknown }

class AuthenticationState extends Equatable {
//holds the authenication status wich is one of the three options
  final authenticationStatus status;
  final User? user;
//initializes with default values
  const AuthenticationState._({
    this.status = authenticationStatus.unknown,
    this.user,
  });

  const AuthenticationState.unkown() : this._();

  const AuthenticationState.authenticated(User user)
      : this._(status: authenticationStatus.authenticated, user: user);
  const AuthenticationState.unauthenticated()
      : this._(status: authenticationStatus.unauthenticated);

  @override
  List<Object?> get props => [status, user];
}
