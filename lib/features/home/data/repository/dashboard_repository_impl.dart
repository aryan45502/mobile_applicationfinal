import 'package:dartz/dartz.dart';
import 'package:wedding_planner/core/error/failure.dart';
import 'package:wedding_planner/features/home/data/data_source/dashboard_remote_datasource.dart';
import 'package:wedding_planner/features/home/data/model/court_model.dart';
import 'package:wedding_planner/features/home/domain/entity/court_entity.dart';
import 'package:wedding_planner/features/home/domain/repository/dashboard_repository.dart';


class DashboardRepositoryImpl implements IDashboardRepository {
  final DashboardRemoteDataSource remoteDataSource;

  DashboardRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<CourtEntity>>> getCourts() async {
    try {
      final List<CourtModel> courtModels = await remoteDataSource.fetchCourts();
      return Right(courtModels);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
