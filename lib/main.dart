import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:nearby/repositories/user_repository.dart';
import 'package:nearby/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nearby/screens/splash_screen.dart';
import 'package:nearby/simple_bloc_delegate.dart';

import 'authentication_bloc/authentication_bloc.dart';
import 'authentication_bloc/authentication_event.dart';
import 'authentication_bloc/authentication_state.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final UserRepository _userRepository = UserRepository();
  AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    super.initState();
    _authenticationBloc = AuthenticationBloc(userRepository: _userRepository);
    _authenticationBloc.dispatch(AppStarted());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: _authenticationBloc,
      child: MaterialApp(
        title: 'Near By',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocBuilder(
          bloc: _authenticationBloc,
          builder: (BuildContext context, AuthenticationState state) {
            if (state is Uninitialized) {
              return SplashScreen();
            }
            if (state is Authenticated) {
              return HomeScreen(name: state.displayName);
            }
          }

        ),
      ),
    );
  }

  @override
  void dispose() {
    _authenticationBloc.dispose();
    super.dispose();
  }
}
