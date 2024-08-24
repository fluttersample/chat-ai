
import 'dart:io';

import 'package:ai_test/core/Dto/Models/Login/LoginResponseModel.dart';
import 'package:ai_test/core/LocalDataBase/Entities/User.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p ;
import 'package:path_provider/path_provider.dart';

import 'Entities/UserConverter.dart';

part 'AppDatabase.g.dart';


@DriftDatabase(tables: [UserDb],)
class AppDatabase extends _$AppDatabase {
  static final AppDatabase _instance = AppDatabase();

  static AppDatabase instance() => _instance;

  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<void> deleteEverything() {
    return transaction(() async {
      for (final table in allTables) {
        await delete(table).go();
      }
    });
  }
  Future deleteUserDb()async {
      return  delete(userDb)..go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}