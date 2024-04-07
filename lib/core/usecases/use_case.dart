import 'package:dartz/dartz.dart';
import 'package:fullfluttersetup/core/errors/failure.dart';

// ignore: one_member_abstracts
abstract interface class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call(Param param);
}

class NoParam {
  const NoParam();
}
