import 'dart:developer';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class ThrottlingBlocObserver extends BlocObserver {
  ThrottlingBlocObserver({required this.throttleDuration});
  final Duration throttleDuration;

  // @override
  // void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
  //   super.onEvent(bloc, event);
  //   if (event is! Stream<dynamic>) return;
  //   event.throttle(throttleDuration);
  //   super.onEvent(bloc, event);
  //   log('testing');
  // }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('${bloc.runtimeType} $change');
    log('testing');
  }
}
