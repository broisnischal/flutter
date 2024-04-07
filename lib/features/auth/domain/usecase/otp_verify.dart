import 'package:dartz/dartz.dart';
import 'package:fullfluttersetup/core/errors/failure.dart';
import 'package:fullfluttersetup/core/usecases/use_case.dart';
import 'package:fullfluttersetup/features/auth/domain/entity/otp_response.dart';
import 'package:fullfluttersetup/features/auth/domain/entity/token_response.dart';
import 'package:fullfluttersetup/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class OTPVerifyUseCase implements UseCase<TokenResponse, OTPEntity> {
  OTPVerifyUseCase(this._repository);
  final AuthRepository _repository;

  @override
  Future<Either<Failure, TokenResponse>> call(OTPEntity param) async {
    return await _repository.otpVerify(
      phoneNumber: param.phone,
      otp: param.otp,
      hash: param.hash,
    );
  }
}
