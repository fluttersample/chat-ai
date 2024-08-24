
import 'package:ai_test/core/Dto/Models/Failure.dart';
import 'package:ai_test/core/Dto/Models/Login/LoginRequestModel.dart';
import 'package:ai_test/core/Dto/Models/Login/LoginResponseModel.dart';
import 'package:ai_test/core/Interfaces/Repository/AiRepository.dart';
import 'package:ai_test/core/Interfaces/UseCases/ILoginUseCase.dart';
import 'package:either_dart/either.dart';


class LoginUseCase extends ILoginUseCase
{

  final AiRepository aiRepository;
  LoginUseCase({required this.aiRepository});

  @override
  Future<Either<Failure, LoginResponseModel>> handler({LoginRequestModel? params}) {
    return  aiRepository.login(requestModel: params!)!;

  }

}