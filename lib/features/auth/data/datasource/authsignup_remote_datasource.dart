import 'package:dio/dio.dart';
import 'package:fullfluttersetup/common/entities/response.dart';
import 'package:fullfluttersetup/core/constants/apiconstant.dart';
import 'package:fullfluttersetup/core/errors/base_exception.dart';
import 'package:fullfluttersetup/core/errors/exception.dart';
import 'package:fullfluttersetup/features/auth/data/models/otp_response_model.dart';
import 'package:injectable/injectable.dart';

abstract interface class AuthRemoteDataSource {
  Future<APIResponse<OTPResponseModel>> signUp(String phoneNumber);
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthSignUpRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthSignUpRemoteDataSourceImpl({required this.dio});
  final Dio dio;

  @override
  Future<APIResponse<OTPResponseModel>> signUp(String phoneNumber) async {
    try {
      final response = await dio.post<Map<String, dynamic>>(ApiConstant.auth);

      final data = response.data!['data'] as Map<String, dynamic>;

      return APIResponse(
        data: OTPResponseModel.fromJson(data),
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
}
