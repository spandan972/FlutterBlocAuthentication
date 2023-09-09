import 'dart:ffi';
import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  Void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log('onCreate -- bloc : ${bloc.runtimeType}');
  }

  @override
  Void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc);
    log('onEvent -- bloc : ${bloc.runtimeType}, event: $event');
  }

  @override
  Void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc);
    log('onChange -- bloc : ${bloc.runtimeType}, Change: $change');
  }

  @override
  Void onTransition(BlocBase bloc, Change change) {
    super.onTransition(bloc);
    log('ontransition -- bloc : ${bloc.runtimeType}, transition: $transition');
  }

  @override
  Void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, StackTrace);
    log('onError -- bloc : ${bloc.runtimeType}, error: $error');
  }

  @override
  Void onClose(BlocBase bloc) {
    super.onChange(bloc);
    log('onChange -- bloc : ${bloc.runtimeType}');
  }
}
