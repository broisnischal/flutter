part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class AuthSignUp extends AuthEvent {
  const AuthSignUp(this.contact);
  final String contact;
}

final class OTPVerify extends AuthEvent {
  const OTPVerify({
    required this.otp,
    required this.hash,
    required this.phoneNumber,
  });
  final String otp;
  final String hash;
  final String phoneNumber;
}
