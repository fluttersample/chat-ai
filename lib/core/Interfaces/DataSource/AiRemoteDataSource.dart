


import 'package:ai_test/core/Dto/Models/Chat/ChatRequestModel.dart';
import 'package:ai_test/core/Dto/Models/Chat/ChatResponseModel.dart';
import 'package:ai_test/core/Dto/Models/Login/LoginRequestModel.dart';
import 'package:ai_test/core/Dto/Models/Login/LoginResponseModel.dart';

abstract class AiRemoteDataSource {

    // login
  Future<LoginResponseModel> login({LoginRequestModel requestModel});

  Future<List<ChatResponseModel>> chatWithAi({ChatRequestModel requestModel});



}