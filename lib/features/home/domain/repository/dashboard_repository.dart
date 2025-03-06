import 'package:dartz/dartz.dart';

import 'package:wedding_planner/core/error/failure.dart';
import 'package:wedding_planner/features/home/domain/entity/court_entity.dart';

abstract class IDashboardRepository {
  Future<Either<Failure, List<CourtEntity>>> getCourts();
}
