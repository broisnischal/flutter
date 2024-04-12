part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  HomeLoaded(this.calendar);
  final List<Calendar> calendar;
}

final class HomeError extends HomeState {
  HomeError(this.message);
  final String message;
}
