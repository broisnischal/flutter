part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthError extends AuthState {
  AuthError({required this.message});
  final String message;
}

final class AuthSuccess extends AuthState {}

final class AuthSuccessWithOtp extends AuthState {
  AuthSuccessWithOtp({required this.otp});
  final OtpResponseEntity otp;
}
