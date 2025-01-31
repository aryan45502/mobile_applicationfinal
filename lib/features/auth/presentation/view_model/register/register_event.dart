part of 'register_bloc.dart';

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class NavigateLoginScreen extends RegisterEvent {
  final BuildContext context;
  final Widget destination;

  const NavigateLoginScreen({required this.context, 
  required this.destination});
}
class UploadImage extends RegisterEvent {
  final File file;

  const UploadImage({
    required this.file,
  });
}

class RegisterUser extends RegisterEvent {
  final BuildContext context;
  final String fullName;
  final String email;
  final String phoneNo;
  final String? image;
  final String password;
  final String weddingdate;
  final String gendertype;

  const RegisterUser({
    required this.context, 
    required this.fullName, 
    required this.email, 
     this.image,
    required this.phoneNo, 
    required this.password,
    required this.weddingdate,
    required  this.gendertype
    
    });
}
