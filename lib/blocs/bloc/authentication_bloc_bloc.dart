import 'dart:async';
import 'package:user_repository/src/user_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:user_repository/user_repository.dart';
import 'package:user_repository/src/models/my_user.dart';

part 'authentication_bloc_event.dart';
part 'authentication_bloc_state.dart';
//Define Bloc itself. Resposible for hablding events and manage state

class AuthenticationBlocBloc
    extends Bloc<AuthenticationBlocEvent, AuthenticationState> {
  final UserRepository userRepository;
  late final StreamSubscription<Myuser> _userSubscription;
//INtialzes userrepository and sets state of bloc to unkown
  AuthenticationBlocBloc({required UserRepository myUserRepository})
      : userRepository = myUserRepository,
        super(const AuthenticationState.unkown()) {
    //Subscription used to listen to changes in the auth state
    _userSubscription = userRepository.user.listen((authUser) {
      add(AuthenticationUserChanged(authUser));
    });
    on<AuthenticationBlocEvent>((event, emit) {
      //if nonnull then authenticated and if null then unauthenticated
      if (event.user != null) {
        emit(AuthenticationState.authenticated(event.user!));
      } else {
        emit(AuthenticationState.unauthenticated());
      }
    });
//bloc is closed
    @override
    Future<void> close() {
      _userSubscription.cancel();
      return super.close();
    }
  }
}
