import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fullfluttersetup/core/usecases/use_case.dart';
import 'package:fullfluttersetup/features/profile/domain/entity/home.dart';
import 'package:fullfluttersetup/features/profile/domain/usecases/get_calendar.dart';
import 'package:injectable/injectable.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required GetCalendar getCalendar,
  })  : _getCalendar = getCalendar,
        super(HomeInitial()) {
    on<GetCalendarData>(_getCalendarData);
  }

  final GetCalendar _getCalendar;

  Future<void> _getCalendarData(
    GetCalendarData event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoading());
    final res = await _getCalendar(const NoParam());
    res.fold(
      (l) => emit(HomeError(l.message)),
      (r) => emit(HomeLoaded(r)),
    );
  }
}
