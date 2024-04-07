import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fullfluttersetup/common/entities/response.dart';
import 'package:fullfluttersetup/core/errors/base_exception.dart';
import 'package:fullfluttersetup/core/errors/exception.dart';
import 'package:fullfluttersetup/core/errors/failure.dart';
import 'package:fullfluttersetup/features/auth/data/datasource/authsignup_remote_datasource.dart';
import 'package:fullfluttersetup/features/auth/domain/entity/otp_response.dart';
import 'package:fullfluttersetup/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required this.authRemoteDataSource});

  final AuthSignUpRemoteDataSource authRemoteDataSource;

  @override
  Future<Either<Failure, APIResponse<OtpResponseEntity>>> signUp({
    required String phoneNumber,
  }) async {
    try {
      final res = await authRemoteDataSource.signUp(phoneNumber);
      return Right(res);
    } on DioException catch (e) {
      final error = BaseErrorEntity(
        message: e.response?.data['message'] as String,
        success: false,
      );

      return Left(BaseException(error.message, baseException: error));
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
