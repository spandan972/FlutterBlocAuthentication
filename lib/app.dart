import 'package:bloctry/app_view.dart';
import 'package:bloctry/blocs/bloc/authentication_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

class MainApp extends StatelessWidget {
  final UserRepository userRepository;
  const MainApp(this.userRepository, {super.key});
//GIt try
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(providers: [
      RepositoryProvider<AuthenticationBlocBloc>(
          create: (_) =>
              AuthenticationBlocBloc(myUserRepository: userRepository))
    ], child: const MyAppView());
  }
}
