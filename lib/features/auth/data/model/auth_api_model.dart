import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:wedplan/features/auth/domain/entity/auth_entity.dart';

part 'auth_api_model.g.dart';

@JsonSerializable()
class AuthApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String? id;
  final String fullname;
  final String email;
  final String? image;
  final String phonenumber;
  final String password;
  final String weddingdate;
  final String gendertype;

  const AuthApiModel({
    this.id,
    required this.fullname,
    required this.email,
    required this.image,
    required this.phonenumber,
    required this.weddingdate,
    required this.gendertype,
    required this.password,
  });

  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  // To Entity
  AuthEntity toEntity() {
    return AuthEntity(
      userId: id,
      fullName: fullname,
      email: email,
      image: image!,
      phoneNo: phonenumber,
      weddingdate: weddingdate,
      gendertype: gendertype,
      password: password ?? '',
    );
  }

  // From Entity
  factory AuthApiModel.fromEntity(AuthEntity entity) {
    return AuthApiModel(
      fullname: entity.fullName,
      email: entity.email,
      image: entity.image,
      phonenumber: entity.phoneNo,
      gendertype: entity.gendertype,
      weddingdate: entity.weddingdate,
      password: entity.password,
    );
  }

  @override
  List<Object?> get props => [
        id,
        fullname,
        email,
        image,
        phonenumber,
        weddingdate,
        gendertype,
        password
      ];
}
