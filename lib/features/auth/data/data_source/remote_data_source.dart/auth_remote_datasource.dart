import 'dart:io';

import 'package:dio/dio.dart';
import 'package:wedplan/app/constants/api_endpoints.dart';
import 'package:wedplan/features/auth/data/data_source/auth_data_source.dart';
import 'package:wedplan/features/auth/data/model/auth_hive_model.dart';
import 'package:wedplan/features/auth/domain/entity/auth_entity.dart';


class AuthRemoteDataSource implements IAuthDataSource {
  final Dio _dio;

  AuthRemoteDataSource(this._dio);
  
  @override
  Future<void> createUser(AuthEntity entity) async {
    try {
      Response response = await _dio.post(
        ApiEndpoints.register,
        data: {
          "fullname": entity.fullName,
          "email": entity.email,
          "phonenumber": entity.phoneNo,
          "image": entity.image,
          "gendertype":entity.gendertype,
          "weddingdate":entity.weddingdate,
          
          "password": entity.password,
          
          
        },
      );

      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

 


  @override
  Future<String> uploadProfilePicture(File file) async {
    try {
      String fileName = file.path.split('/').last;
      FormData formData = FormData.fromMap(
        {
          'profilePicture': await MultipartFile.fromFile(
            file.path,
            filename: fileName,
          ),
        },
      );

      Response response = await _dio.post(
        ApiEndpoints.uploadImage,
        data: formData,
      );

      if (response.statusCode == 200) {
        // Extract the image name from the response
        final str = response.data['data'];

        return str;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }



  @override
  Future<List<AuthHiveModel>> getalluser() {
    // TODO: implement getalluser
    throw UnimplementedError();
  }

  @override
  Future<String> loginUser(String email, String password)async {
    try {
      Response response = await _dio.post(
        ApiEndpoints.login,
        data: {
          "email": email,
          "password": password,
        },
      );

      if (response.statusCode == 200) {
        final str = response.data['token'];
        return str;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }
}
