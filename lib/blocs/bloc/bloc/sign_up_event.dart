part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();
  @override
  List<Object> get props => [];
}

class SignUprequired extends SignUpEvent {
  final Myuser user;
  final String password;

  const SignUprequired(this.user, this.password);
}
