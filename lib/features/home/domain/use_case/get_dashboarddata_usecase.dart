import 'package:dartz/dartz.dart';

import 'package:wedding_planner/core/error/failure.dart';
import 'package:wedding_planner/features/home/domain/entity/court_entity.dart';
import 'package:wedding_planner/features/home/domain/repository/dashboard_repository.dart';

class GetDashboardDataUseCase {
  final IDashboardRepository repository;

  GetDashboardDataUseCase(this.repository);

  Future<Either<Failure, List<CourtEntity>>> call() async {
    return repository.getCourts();
  }
}
