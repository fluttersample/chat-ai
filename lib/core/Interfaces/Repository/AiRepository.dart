



import 'package:ai_test/core/Dto/Models/Chat/ChatRequestModel.dart';
import 'package:ai_test/core/Dto/Models/Chat/ChatResponseModel.dart';
import 'package:ai_test/core/Dto/Models/Failure.dart';
import 'package:ai_test/core/Dto/Models/Login/LoginRequestModel.dart';
import 'package:ai_test/core/Dto/Models/Login/LoginResponseModel.dart';
import 'package:either_dart/either.dart';

abstract class AiRepository {

  Future<Either<Failure, LoginResponseModel>>? login({required LoginRequestModel requestModel});

  Future<Either<Failure, List<ChatResponseModel>>>? chatWithAi({required ChatRequestModel requestModel});


}