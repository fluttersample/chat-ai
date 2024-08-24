

import 'dart:convert';

import 'package:ai_test/core/Dto/Models/Chat/ChatRequestModel.dart';
import 'package:ai_test/core/Dto/Models/Chat/ChatResponseModel.dart';
import 'package:ai_test/core/Helper/BaseBrain.dart';
import 'package:ai_test/core/Dto/Models/Login/LoginRequestModel.dart';
import 'package:ai_test/core/Dto/Models/Login/LoginResponseModel.dart';
import 'package:ai_test/core/Helper/Api.dart';
import 'package:ai_test/core/Interfaces/DataSource/AiRemoteDataSource.dart';

class AiRemoteDataSourceImpl implements AiRemoteDataSource{


  @override
  Future<LoginResponseModel> login({LoginRequestModel? requestModel}) async{
    var result = await BaseBrain.dio.post(Api.LOGIN,data: requestModel?.toJson()).then((response) {
      final loginResponseUseCase = LoginResponseModel.fromJson(response.data);
      return loginResponseUseCase;
    });

    return result;
  }

  @override
  Future<List<ChatResponseModel>> chatWithAi({ChatRequestModel? requestModel}) async{
    var result = await BaseBrain.dio.post(Api.GENERATE_AI_WRITER,data: requestModel?.toJson(),
        cancelToken: BaseBrain.cancelToken).then((response) {
      List<dynamic> jsonList = (response.data as String)
          .split('data:')
          .map((jsonItem) {
        return jsonItem;
      }).toList();
      jsonList.removeAt(0);
      List<ChatResponseModel> listData =[];
      for (var element in jsonList) {
        listData.add(ChatResponseModel.fromJson(jsonDecode(element)));
      }
      return listData;
    });

    return result;
  }

}