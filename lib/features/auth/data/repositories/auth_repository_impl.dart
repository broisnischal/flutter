import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fullfluttersetup/core/errors/base_exception.dart';
import 'package:fullfluttersetup/core/errors/exception.dart';
import 'package:fullfluttersetup/core/errors/failure.dart';
import 'package:fullfluttersetup/features/auth/data/datasource/authsignup_remote_datasource.dart';
import 'package:fullfluttersetup/features/auth/domain/entity/otp_response.dart';
import 'package:fullfluttersetup/features/auth/domain/entity/token_response.dart';
import 'package:fullfluttersetup/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required this.authRemoteDataSource});

  final AuthRemoteDataSource authRemoteDataSource;

  @override
  Future<Either<Failure, OTPEntity>> signUp({
    required String phoneNumber,
  }) async {
    try {
      final res = await authRemoteDataSource.signUp(phoneNumber);
      return Right(res.data! as OTPEntity);
    } on DioException catch (e) {
      final error = BaseErrorEntity(
        message: e.response?.data['message'] as String,
        success: false,
      );

      return Left(BaseException(error.message, baseException: error));
    } on BaseException catch (e) {
      return left(Failure(e.baseException.message));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, TokenResponse>> otpVerify({
    required String phoneNumber,
    required String otp,
    required String hash,
  }) async {
    try {
      final res = await authRemoteDataSource.otpVerify(
        phoneNumber: phoneNumber,
        otp: otp,
        hash: hash,
      );

      return Right(res.data! as TokenResponse);
    } on BaseException catch (e) {
      return left(Failure(e.baseException.message));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
