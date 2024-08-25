

import 'package:ai_test/ai_injection_container.dart';
import 'package:ai_test/core/Dto/Models/Chat/ChatResponseModel.dart';
import 'package:ai_test/core/LocalDataBase/AppDatabase.dart';
import 'package:ai_test/core/LocalDataBase/Tables/User.dart';
import 'package:ai_test/core/services/dioConfig/DioConfig.dart';
import 'package:dio/dio.dart';
import '../Dto/Models/Login/LoginResponseModel.dart';

class BaseBrain {
  static late Dio dio;
  static  CancelToken cancelToken = CancelToken();


  static UserEntity userEntity = UserEntity();

  static void reloadDio() {
    dio = DioConfig().initDio;
  }
  static void cancelTokenResponse(){
    cancelToken.cancel();
    if(cancelToken.isCancelled)
    { cancelToken =  CancelToken(); }
  }



  static void setUserData(LoginResponseModel data) {
    userEntity = UserEntity(
        user: data.workspace?.user,
        id: 1,
        accessToken: data.accessToken,
        refreshToken: data.refreshToken);
  }

  static Future<void> loadUserDataFromLocal() async {
    final dataBase = injector<AppDatabase>();
    final result = await dataBase.select(dataBase.userDb).get();

    if(result.isNotEmpty){
      final userData = result.firstWhere((element) => element.id == 1);
      final convertData = LoginResponseModel(
          workspace: WorkspaceModel(user: userData.user),
          refreshToken: userData.refreshToken,
          accessToken: userData.accessToken);
      setUserData(convertData);
    }

  }

  static String convertContentData(List<ChatResponseModel> listData){
    // List<dynamic> jsonList = listData
    //     .split('data:')
    //     .map((jsonItem) {
    //   return jsonItem;
    // }).toList();
    String combinedContent = listData
        .map((item) {
      final text = item.content;
      return text ?? '';
    }).join("");
    return combinedContent;

  }
}
