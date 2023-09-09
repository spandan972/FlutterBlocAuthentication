import 'package:bloctry/blocs/bloc/authentication_bloc_bloc.dart';
import 'package:bloctry/screens/authentication/home/home_screen.dart';
import 'package:bloctry/screens/welcome_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/bloc/authentication_bloc_bloc.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'AUTHENTICATION APP',
        theme: ThemeData(
          colorScheme: const ColorScheme.dark(background: Colors.white),
        ),
        home: BlocBuilder<AuthenticationState, AuthenticationState>(
          builder: (context, State) {
            if (State.status == AuthenticationStatus.authenticated) {
              return const HomeScreen();
            } else {
              return const WelcomeScreen();
            }
          },
        ));
  }
}
