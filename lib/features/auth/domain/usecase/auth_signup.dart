import 'package:dartz/dartz.dart';
import 'package:fullfluttersetup/core/errors/failure.dart';
import 'package:fullfluttersetup/core/usecases/use_case.dart';
import 'package:fullfluttersetup/features/auth/domain/entity/otp_response.dart';
import 'package:fullfluttersetup/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthSignUpUseCase
    implements UseCase<OtpResponseEntity, AuthSignUpParams> {
  AuthSignUpUseCase(this._repository);
  final AuthRepository _repository;

  @override
  Future<Either<Failure, OtpResponseEntity>> call(
    AuthSignUpParams param,
  ) async {
    return await _repository.signUp(phoneNumber: param.phoneNumber);
  }
}

class AuthSignUpParams {
  AuthSignUpParams({required this.phoneNumber});
  final String phoneNumber;
}
