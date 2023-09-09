import 'package:bloctry/blocs/bloc/bloc/sign_in_bloc.dart';
import 'package:bloctry/screens/authentication/sign_in_screen.dart';
import 'package:bloctry/screens/authentication/sign_up_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with TickerProviderStateMixin{
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
      )
  }

  Widget build(BuildContext context) {
    return const Scaffold(
      body:  SingleChildScrollView(
        appbar: AppBar(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              TabBar(
                controller: tabController,
                tabs: [
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Sign In'
                    style: TextStyle(fontSize: 18,
                    ),
                  ), )
                  Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Sign Up'
                    style: TextStyle(fontSize: 18,
                    ),
                  ), )
              ])
              Expanded(
                child: TabBarView(
                  controller: tabController,
                  children:[
                   BlocProvider<SignInBloc>(
                    create: (context) => SignInBloc(
                      UserRepository: context.read<authticationBloc>().userRepository
                    ),
                    child: const SignInScreen(),
                   ),
                  create: (context) => SignInBloc(
                      UserRepository: context.read<authticationBloc>().userRepository
                    ),
                    child: const SignInScreen(),
                  ] ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
