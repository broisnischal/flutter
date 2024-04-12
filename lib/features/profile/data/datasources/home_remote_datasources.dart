import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:fullfluttersetup/core/constants/apiconstant.dart';
import 'package:fullfluttersetup/core/errors/base_exception.dart';
import 'package:fullfluttersetup/core/errors/exception.dart';
import 'package:fullfluttersetup/features/profile/data/models/homemodel.dart';
import 'package:injectable/injectable.dart';

abstract interface class HomeRemoteDataSource {
  Future<List<CalendarModel>> getCalendar();
}

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  HomeRemoteDataSourceImpl({required this.dio});

  final Dio dio;

  @override
  Future<List<CalendarModel>> getCalendar() async {
    try {
      final res = await dio.get<List<dynamic>>(ApiConstant.month);

      log(res.realUri.toString());

      log(res.data.toString());

      final data = res.data!;

      // log(res.toString());
      // log(data.toString());

      return data
          .map((e) => CalendarModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      log(e.toString());
      final error = BaseErrorEntity(
        // ignore: avoid_dynamic_calls
        message: 'error',
        success: false,
      );
      throw BaseException(error.message, baseException: error);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
