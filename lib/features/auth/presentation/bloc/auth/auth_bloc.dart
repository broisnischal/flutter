import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fullfluttersetup/features/auth/domain/entity/otp_response.dart';
import 'package:fullfluttersetup/features/auth/domain/entity/token_response.dart';
import 'package:fullfluttersetup/features/auth/domain/usecase/auth_signup.dart';
import 'package:fullfluttersetup/features/auth/domain/usecase/otp_verify.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required AuthSignUpUseCase authSignUp,
    required OTPVerifyUseCase otpVerify,
  })  : _authSignUp = authSignUp,
        _otpVerify = otpVerify,
        super(AuthInitial()) {
    on<AuthEvent>((event, emit) => emit(AuthLoading()));

    on<AuthSignUp>(_onAuthSignUp);

    on<OTPVerify>(_onOtpVerify);
  }

  Future<void> _onAuthSignUp(
    AuthSignUp event,
    Emitter<AuthState> emit,
  ) async {
    final result =
        await _authSignUp(AuthSignUpParams(phoneNumber: event.contact));

    result.fold(
      (l) => emit(AuthError(message: l.message)),
      (r) => emit(AuthSuccessWithOtp(otp: r)),
    );
  }

  Future<void> _onOtpVerify(
    OTPVerify event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _otpVerify(
      OTPEntity(hash: event.hash, otp: event.otp, phone: event.phoneNumber),
    );

    result.fold(
      (l) => emit(AuthError(message: l.message)),
      (r) => emit(AuthSuccessWithToken(tokenResponse: r)),
    );
  }

  final AuthSignUpUseCase _authSignUp;
  final OTPVerifyUseCase _otpVerify;
}
