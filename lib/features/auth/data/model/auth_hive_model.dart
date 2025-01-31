import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:uuid/uuid.dart';
import 'package:wedplan/app/constants/hive_table_constant.dart';
import 'package:wedplan/features/auth/domain/entity/auth_entity.dart';


// dart run build_runner build -d

part 'auth_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.userTableId)
class AuthHiveModel extends Equatable {
  @HiveField(0)
  final String? userId;
  @HiveField(1)
  final String fullName;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String phoneNo;

  @HiveField(4)
  final String password;

  @HiveField(5)
  final String weddingdate;

  @HiveField(6)
  final String gendertype;

  @HiveField(7)
  final String image;

  AuthHiveModel(
      {String? userId,
      required this.fullName,
      required this.email,
      required this.phoneNo,
      required this.image,
      required this.weddingdate,
      required this.gendertype,
      required this.password})
      : userId = userId ?? const Uuid().v4();

  const AuthHiveModel.initial(
      {this.userId = "",
      this.fullName = "",
      this.email = "",
      this.image = "",
      this.password = "",
      this.phoneNo = "",
      this.weddingdate = "",
      this.gendertype = ""});

  factory AuthHiveModel.fromEntity(AuthEntity entity) {
    return AuthHiveModel(
        fullName: entity.fullName,
        email: entity.email,
        userId: entity.userId,
        password: entity.password,
        phoneNo: entity.phoneNo,
        image:entity.image,
        weddingdate: entity.weddingdate,
        gendertype: entity.gendertype);
  }
  AuthEntity toEntity() {
    return AuthEntity(
        userId: userId,
        fullName: fullName,
        email: email,
        image: image,
        phoneNo: phoneNo,
        weddingdate: weddingdate,
        gendertype: gendertype,
        password: password);
  }

  static List<AuthHiveModel> fromEntitytoList(List<AuthEntity> entities) {
    return entities.map((e) => AuthHiveModel.fromEntity(e)).toList();
  }

  static List<AuthEntity> toEntityList(List<AuthHiveModel> entities) {
    return entities.map((e) => e.toEntity()).toList();
  }

  @override
  List<Object?> get props => [userId];
}
