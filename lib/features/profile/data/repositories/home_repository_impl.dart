import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fullfluttersetup/core/errors/base_exception.dart';
import 'package:fullfluttersetup/core/errors/exception.dart';
import 'package:fullfluttersetup/core/errors/failure.dart';
import 'package:fullfluttersetup/features/profile/data/datasources/home_remote_datasources.dart';
import 'package:fullfluttersetup/features/profile/domain/entity/home.dart';
import 'package:fullfluttersetup/features/profile/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({required this.homeRemoteDatasource});

  final HomeRemoteDataSource homeRemoteDatasource;

  @override
  Future<Either<Failure, List<Calendar>>> getCalendarData() async {
    try {
      final res = await homeRemoteDatasource.getCalendar();

      return Right(res);
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
}
