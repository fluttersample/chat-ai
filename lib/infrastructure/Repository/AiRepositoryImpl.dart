


import 'package:ai_test/core/Dto/Models/Chat/ChatRequestModel.dart';
import 'package:ai_test/core/Dto/Models/Chat/ChatResponseModel.dart';
import 'package:ai_test/core/Dto/Models/Failure.dart';
import 'package:ai_test/core/Dto/Models/Login/LoginRequestModel.dart';
import 'package:ai_test/core/Dto/Models/Login/LoginResponseModel.dart';
import 'package:ai_test/core/Interfaces/DataSource/AiRemoteDataSource.dart';
import 'package:ai_test/core/Interfaces/Repository/AiRepository.dart';
import 'package:either_dart/either.dart';

class AiRepositoryImpl implements AiRepository{

  final AiRemoteDataSource aiDataSource;

  AiRepositoryImpl({required this.aiDataSource});
  @override
  Future<Either<Failure, LoginResponseModel>>? login({required LoginRequestModel requestModel})async {
    try {
      var result = await aiDataSource.login(requestModel: requestModel);
      return Right(result);
    } catch (e) {
      print(e);
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ChatResponseModel>>>? chatWithAi({required ChatRequestModel requestModel}) async{
    try {
      var result = await aiDataSource.chatWithAi(requestModel: requestModel);
      return Right(result);
    } catch (e) {
      print(e);
      return Left(ServerFailure());
    }
  }

}