import 'package:dartz/dartz.dart';
import 'package:wedding_planner/core/error/failure.dart';
import 'package:wedding_planner/features/home/data/model/booking_model.dart';
import 'package:wedding_planner/features/home/domain/repository/booking_repository.dart';


class GetBookingsUseCase {
  final IBookingRepository repository;

  GetBookingsUseCase(this.repository);

  Future<Either<Failure, List<BookingModel>>> call() async {
    return repository.getBookings();
  }
}
