


import 'package:ai_test/core/Interfaces/DataSource/AiRemoteDataSource.dart';
import 'package:ai_test/core/Interfaces/Repository/AiRepository.dart';
import 'package:ai_test/core/Interfaces/UseCases/ILoginUseCase.dart';
import 'package:ai_test/core/LocalDataBase/AppDatabase.dart';
import 'package:ai_test/core/UseCases/ChatUseCase.dart';
import 'package:ai_test/core/UseCases/LoginUseCase.dart';
import 'package:ai_test/infrastructure/DataSource/AiDataSourceImpl.dart';
import 'package:ai_test/infrastructure/Repository/AiRepositoryImpl.dart';
import 'package:get_it/get_it.dart';

import 'core/LocalDataBase/platform/platform.dart';

final injector = GetIt.instance;

Future<void> init () async {
  injector.registerLazySingleton(() => AppDatabase(DBCreator.createDatabaseConnection('ai-test')));


  // Data Resources
  injector.registerLazySingleton<AiRemoteDataSource>(() => AiRemoteDataSourceImpl());

  //Repositories
  injector.registerLazySingleton<AiRepository>(() =>AiRepositoryImpl(aiDataSource: injector()));

  /// Use Cases
  injector.registerLazySingleton(() => LoginUseCase(aiRepository: injector()));
  injector.registerLazySingleton(() => ChatUseCase(aiRepository: injector()));

}