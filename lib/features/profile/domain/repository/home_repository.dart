import 'package:dartz/dartz.dart';
import 'package:fullfluttersetup/core/errors/failure.dart';
import 'package:fullfluttersetup/features/profile/domain/entity/home.dart';

abstract interface class HomeRepository {
  Future<Either<Failure, List<Calendar>>> getCalendarData();
}
