
import 'package:ai_test/core/Dto/Models/Login/LoginRequestModel.dart';
import 'package:ai_test/core/Dto/Models/Login/LoginResponseModel.dart';

import 'IUseCase.dart';

abstract class ILoginUseCase extends IUseCase<LoginResponseModel,LoginRequestModel>{}