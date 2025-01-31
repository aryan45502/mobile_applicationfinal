import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:wedplan/core/error/failure.dart';
import 'package:wedplan/features/auth/data/data_source/remote_data_source.dart/auth_remote_datasource.dart';
import 'package:wedplan/features/auth/domain/entity/auth_entity.dart';
import 'package:wedplan/features/auth/domain/repository/auth_repository.dart';


class AuthRemoteRepository implements IAuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;

  AuthRemoteRepository(this._authRemoteDataSource);

  @override
  Future<Either<Failure, void>> createUser(AuthEntity entity) async {
    try {
      await _authRemoteDataSource.createUser(entity);
      return Right(null);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> loginUser(
      String username, String password) async {
    try {
      final token =
          await _authRemoteDataSource.loginUser(username, password);
      return Right(token);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> uploadProfilePicture(File file) async {
    try {
      final imageName = await _authRemoteDataSource.uploadProfilePicture(file);
      return Right(imageName);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }
}
