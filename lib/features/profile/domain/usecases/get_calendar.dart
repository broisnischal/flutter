import 'package:dartz/dartz.dart';
import 'package:fullfluttersetup/core/errors/failure.dart';
import 'package:fullfluttersetup/core/usecases/use_case.dart';
import 'package:fullfluttersetup/features/profile/domain/entity/home.dart';
import 'package:fullfluttersetup/features/profile/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCalendar implements UseCase<List<Calendar>, NoParam> {
  GetCalendar({required this.homeRepository});

  final HomeRepository homeRepository;

  @override
  Future<Either<Failure, List<Calendar>>> call(NoParam param) async {
    return await homeRepository.getCalendarData();
  }
}
