import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/src/user_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:user_repository/src/models/my_user.dart';
part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository _userRepository;

  SignUpBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(SignUpIntial()) {
    on<SignUprequired>((event, emit) async {
      emit(SignUpProcess());
      try {
        Myuser user = await _userRepository.signUp(event.user, event.password);
        await _userRepository.setUserData(user);
        emit(SignUpSuccess());
      } catch (e) {
        emit(SignUpFailure());
      }
    });
  }
}
