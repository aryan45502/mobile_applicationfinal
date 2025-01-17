import 'package:dartz/dartz.dart';
import 'package:wedplan/core/error/failure.dart';
import 'package:wedplan/features/auth/domain/entity/auth_entity.dart';


abstract interface class IAuthRepository{
  Future<Either<Failure,void>>createUser(AuthEntity entity);
  Future<Either<Failure,String>>loginUser(String username,String password); 


}