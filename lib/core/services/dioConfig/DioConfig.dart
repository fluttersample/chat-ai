
import 'package:ai_test/core/Helper/BaseBrain.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'dart:developer' as l;

import 'DioInterceptor.dart';
class DioConfig {
  static final DioConfig _instance = DioConfig._internal();
  factory DioConfig() => _instance;

  late Dio _dio;



  DioConfig._internal() {
    BaseOptions options =  BaseOptions(
      baseUrl: 'http://5.78.55.161:8000',
        connectTimeout: const Duration(milliseconds: 25000),
      receiveTimeout: const Duration(milliseconds: 25000),
      headers: {
         "Content-Type": "application/json",
        'Authorization' : 'Basic dGVzdEB0ZXN0LmNvbTp0ZXN0MTIzNDU='
      },
      responseType: ResponseType.json,
    );

     Dio dio =  Dio(options);

  if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true,
      requestHeader: true,responseHeader: true,
      logPrint: (object) {
        l.log(object.toString());
      },));
    }
    dio.interceptors.add(DioInterceptor());
    _dio = dio;


  }

  
  Dio get initDio =>_dio;
}