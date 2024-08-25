
import 'dart:async';

import 'package:ai_test/core/Dto/Models/Login/LoginResponseModel.dart';
import 'package:drift/drift.dart';

import '../Dto/Models/Chat/ChatRequestModel.dart';
import 'Tables/ListMessages.dart';
import 'Tables/User.dart';

part 'AppDatabase.g.dart';


@DriftDatabase(tables: [UserDb,ListMessagesTable],)
class AppDatabase extends _$AppDatabase {


  AppDatabase(super.executor);

  @override
  int get schemaVersion => 1;


  /// deletes
  Future deleteUserDb()async {
      return delete(userDb)..go();
  }
  Future deleteMessageListDb()async{
    return delete(listMessagesTable)..go();
  }
  Future<void> deleteEverything() {
    return transaction(() async {
      for (final table in allTables) {
        await delete(table).go();
      }
    });
  }

  /// inserts
  Future<void> setDataToListMessage(MessagesModel messagesModel)async{
    final listMessage = await getAllMessages;
   await into(listMessagesTable).insert(ListMessagesTableCompanion(messages: Value(messagesModel)));

    print(listMessage.length);
  }


  ///
  Future<List<ListMessagesTableData>> get getAllMessages => select(listMessagesTable).get();

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(beforeOpen: (details) async {
      await customStatement('PRAGMA foreign_keys = ON');
    }, onCreate: (m) async {
      await m.createAll();
    }
    );
  }

}

