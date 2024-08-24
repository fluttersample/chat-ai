

import 'package:ai_test/core/Dto/Models/Chat/ChatRequestModel.dart';
import 'package:ai_test/core/Dto/Models/Chat/ChatResponseModel.dart';
import 'package:ai_test/core/Dto/Models/Failure.dart';
import 'package:ai_test/core/Interfaces/Repository/AiRepository.dart';
import 'package:ai_test/core/Interfaces/UseCases/IChatUseCase.dart';
import 'package:either_dart/either.dart';


class ChatUseCase extends IChatUseCase
{

  final AiRepository aiRepository;
  ChatUseCase({required this.aiRepository});

  @override
  Future<Either<Failure, List<ChatResponseModel>>> handler({ChatRequestModel? params}) {
      return aiRepository.chatWithAi(requestModel: params!)!;
  }



}