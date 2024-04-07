import 'package:dio/dio.dart';
import 'package:fullfluttersetup/common/entities/response.dart';
import 'package:fullfluttersetup/core/constants/apiconstant.dart';
import 'package:fullfluttersetup/core/errors/base_exception.dart';
import 'package:fullfluttersetup/core/errors/exception.dart';
import 'package:fullfluttersetup/features/auth/data/models/otp_response_model.dart';
import 'package:fullfluttersetup/features/auth/data/models/token_response_model.dart';
import 'package:injectable/injectable.dart';

abstract interface class AuthRemoteDataSource {
  Future<APIResponse<OTPModel>> signUp(String phoneNumber);
  Future<APIResponse<TokenResponseModel>> otpVerify({
    required String phoneNumber,
    required String otp,
    required String hash,
  });

  // Future<APIResponse<OTPResponseModel>> resendOTP(String phoneNumber);
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthSignUpRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthSignUpRemoteDataSourceImpl({required this.dio});
  final Dio dio;

  @override
  Future<APIResponse<OTPModel>> signUp(String phoneNumber) async {
    try {
      final response = await dio.post<Map<String, dynamic>>(
        ApiConstant.auth,
        data: {'contact': phoneNumber},
      );

      final data = response.data!['data'] as Map<String, dynamic>;

      return APIResponse(
        data: OTPModel.fromJson(data),
        message: response.data!['message'] as String,
        success: true,
      );
    } on DioException catch (e) {
      final error = BaseErrorEntity(
        // ignore: avoid_dynamic_calls
        message: e.response?.data['message'] as String,
        success: false,
      );
      throw BaseException(error.message, baseException: error);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<APIResponse<TokenResponseModel>> otpVerify({
    required String phoneNumber,
    required String otp,
    required String hash,
  }) async {
    try {
      final res = await dio.post<Map<String, dynamic>>(
        ApiConstant.otpverify,
        data: {'phone': phoneNumber, 'otp': otp, 'hash': hash},
      );

      final data = res.data!['data'] as Map<String, dynamic>;

      return APIResponse(
        data: TokenResponseModel.fromJson(data),
        message: res.data!['message'] as String,
        success: true,
      );
    } on DioException catch (e) {
      final error = BaseErrorEntity(
        // ignore: avoid_dynamic_calls
        message: e.response?.data['message'] as String,
        success: false,
      );

      throw BaseException(error.message, baseException: error);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
