



import 'package:ai_test/core/Dto/Models/Chat/ChatRequestModel.dart';
import 'package:ai_test/core/Dto/Models/Chat/ChatResponseModel.dart';

import 'IUseCase.dart';

abstract class IChatUseCase extends IUseCase<List<ChatResponseModel>,ChatRequestModel>{}