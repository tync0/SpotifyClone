import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenInterceptor extends Interceptor {
  late FlutterSecureStorage _storage;
  String? token;

  TokenInterceptor() {
    _init();
  }

  Future<void> _init() async {
    _storage = const FlutterSecureStorage();
    if (await _storage.containsKey(key: 'token')) {
      token = await _storage.read(key: 'token');
    }
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    debugPrint("Request: $options");
    token = await _storage.read(key: 'token');
    if (token != null) {
      options.headers['Authorization'] = 'Token $token';
    }
    return handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    return handler.next(response);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    debugPrint("Error: $err");
    return handler.next(err);
  }
}
