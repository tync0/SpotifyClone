import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:spotify/src/core/resource/data_state.dart';
import 'package:spotify/src/features/auth/data/datasource/auth_datasource.dart';
import 'package:spotify/src/features/auth/data/model/user_model.dart';
import 'package:spotify/src/features/auth/domain/entity/user_entity.dart';

import '../../domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthDatasource _authDatasource;
  AuthRepositoryImpl(this._authDatasource);

  @override
  Future<DataState<UserModel>> userLogin(
    String username,
    String password,
  ) async {
    try {
      final httpResponse = await _authDatasource.userLogin(
        {
          "username": username,
          "password": password,
        },
      );
      if (httpResponse.response.statusCode == 200) {
        final responseData = httpResponse.response.data;
        return DataSuccess(
          httpResponse.data,
        );
      } else {
        return DataFailed(
          DioException(
            requestOptions: httpResponse.response.requestOptions,
            error: httpResponse.response.data,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<UserEntity>> userRegister(
    String username,
    String password,
    String firstName,
    String email,
  ) async {
    try {
      final httpResponse = await _authDatasource.userRegister(
        {
          "username": username,
          "password": password,
          "first_name": firstName,
          "email": email,
        },
      );
      if (httpResponse.response.statusCode == 200) {
        final responseData = httpResponse.response.data;
        return DataSuccess(
          httpResponse.data,
        );
      } else {
        return DataFailed(
          DioException(
            requestOptions: httpResponse.response.requestOptions,
            error: httpResponse.response.data,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
