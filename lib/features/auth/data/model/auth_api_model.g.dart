// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthApiModel _$AuthApiModelFromJson(Map<String, dynamic> json) => AuthApiModel(
      id: json['_id'] as String?,
      fullname: json['fullname'] as String,
      email: json['email'] as String,
      image: json['image'] as String?,
      phonenumber: json['phonenumber'] as String,
      weddingdate: json['weddingdate'] as String,
      gendertype: json['gendertype'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$AuthApiModelToJson(AuthApiModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'fullname': instance.fullname,
      'email': instance.email,
      'image': instance.image,
      'phonenumber': instance.phonenumber,
      'password': instance.password,
      'weddingdate': instance.weddingdate,
      'gendertype': instance.gendertype,
    };
