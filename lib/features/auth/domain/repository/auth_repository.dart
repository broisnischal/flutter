import 'package:dartz/dartz.dart';
import 'package:fullfluttersetup/common/entities/response.dart';
import 'package:fullfluttersetup/core/errors/failure.dart';
import 'package:fullfluttersetup/features/auth/domain/entity/otp_response.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, APIResponse<OtpResponseEntity>>> signUp({
    required String phoneNumber,
  });
}
