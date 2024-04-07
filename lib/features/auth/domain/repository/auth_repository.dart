import 'package:dartz/dartz.dart';
import 'package:fullfluttersetup/core/errors/failure.dart';
import 'package:fullfluttersetup/features/auth/domain/entity/otp_response.dart';
import 'package:fullfluttersetup/features/auth/domain/entity/token_response.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, OTPEntity>> signUp({
    required String phoneNumber,
  });

  Future<Either<Failure, TokenResponse>> otpVerify({
    required String phoneNumber,
    required String otp,
    required String hash,
  });
}
