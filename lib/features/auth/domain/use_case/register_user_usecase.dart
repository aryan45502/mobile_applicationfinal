import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';


import 'package:wedplan/app/usecase/usecase.dart';
import 'package:wedplan/core/error/failure.dart';
import 'package:wedplan/features/auth/domain/entity/auth_entity.dart';
import 'package:wedplan/features/auth/domain/repository/auth_repository.dart';

class RegisterUserParams extends Equatable{
  final String fullName;
  final String email;
  final String phoneNo;
  final String password;
  final String weddingdate;
  final String gendertype;

  const RegisterUserParams({
    required this.fullName,
    required this.email,
    required this.phoneNo,
    required this.password,
    required this.weddingdate,
    required this.gendertype
  });


   const RegisterUserParams.initial():
  fullName= '',
  email='',
  phoneNo='',
  password = '',
  weddingdate = '',
  gendertype = '';

  @override
  List<Object?> get props => [fullName,email,phoneNo,password,weddingdate,gendertype];

}

class RegisterUserUsecase implements UsecaseWithParams<void, RegisterUserParams> {
  final IAuthRepository authRepository;

  RegisterUserUsecase({required this.authRepository});

  @override
  Future<Either<Failure, void>> call(RegisterUserParams params) {
    final authEntity =AuthEntity(
      fullName: params.fullName, 
      email: params.email, 
      phoneNo: params.phoneNo,
      password: params.password,
      weddingdate: params.weddingdate,
      gendertype: params.gendertype
      
      
      ); 
    
    return authRepository.createUser(authEntity);
  }

}