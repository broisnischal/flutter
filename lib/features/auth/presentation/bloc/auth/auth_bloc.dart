import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fullfluttersetup/features/auth/domain/entity/otp_response.dart';
import 'package:fullfluttersetup/features/auth/domain/usecase/auth_signup.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required AuthSignUpUseCase authSignUp,
  })  : _authSignUp = authSignUp,
        super(AuthInitial()) {
    on<AuthEvent>((event, emit) => emit(AuthLoading()));

    on<AuthSignUp>(_onAuthSignUp);
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

  final AuthSignUpUseCase _authSignUp;
}
