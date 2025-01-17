import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable{
  final String? userId;
  final String fullName;
  final String email;
  final String password;
  final String phoneNo;
  final String weddingdate;
  final String gendertype;

  AuthEntity({ this.userId,required this.weddingdate,required this.gendertype, required this.phoneNo,required this.fullName, required this.email, required this.password});
  
  @override
  // TODO: implement props
  List<Object?> get props => [userId,fullName,email,password,phoneNo,gendertype,weddingdate];
  
}