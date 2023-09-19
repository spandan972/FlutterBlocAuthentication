import 'dart:developer';
import 'package:user_repository/src/user_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final UserRepository _userRepository;

  SignInBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(SignInIntial()) {
    on<SignInRequired>((event, emit) async {
      emit(SIgnInProcess());
      try {
        await _userRepository.signIn(event.email, event.password);
        emit(SignInSuccess());
      } catch (e) {
        log(e.toString());
        emit(SignInFailure());
      }
    });
    on<SignOutRequired>(
      (event, emit) async {
        await _userRepository.logOut();
      },
    );
  }
}
