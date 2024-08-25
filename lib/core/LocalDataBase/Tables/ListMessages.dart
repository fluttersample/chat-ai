
import 'dart:convert';

import 'package:ai_test/core/Dto/Models/Chat/ChatRequestModel.dart';
import 'package:drift/drift.dart';

class ListMessagesTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get messages =>
      text().map(const MessagesConverter()).nullable()();



}





class MessagesConverter extends TypeConverter<MessagesModel, String> {
  const MessagesConverter();

  @override
  MessagesModel fromSql(String fromDb) {
    return MessagesModel.fromJson(jsonDecode(fromDb) as Map<String, dynamic>);

  }

  @override
  String toSql(MessagesModel value) {
    return jsonEncode(value.toJson());
  }



  // @override
  // UserModel fromSql(String fromDb) {
  //   return UserModel.fromJson(jsonDecode(fromDb) as Map<String, dynamic>);
  // }
  //
  // @override
  // String toSql(UserModel value) {
  //   return jsonEncode(value.toJson());
  // }


}