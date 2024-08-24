


import 'package:ai_test/core/Helper/BaseBrain.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DioInterceptor extends QueuedInterceptorsWrapper{


  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // options.headers['Authorization'] = 'Basic ${BaseBrain.userEntity.accessToken}';
    // print("XXXXX ${options.headers}");

    return handler.next(options);
  }

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    return super.onResponse(response, handler);

  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {

    if(err.type != DioExceptionType.cancel){
      Fluttertoast.showToast(
          backgroundColor:  Colors.red,
          textColor: Colors.white,
          msg: 'خطایی رخ داده است !');
    }


    return super.onError(err, handler);
  }
}