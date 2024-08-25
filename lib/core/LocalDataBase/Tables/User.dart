

import 'dart:convert';

import 'package:ai_test/core/Dto/Models/Login/LoginResponseModel.dart';
import 'package:drift/drift.dart';

class UserDb extends Table {
  IntColumn get id => integer()();
  TextColumn get accessToken => text().nullable()();
  TextColumn get refreshToken => text()();

  TextColumn get user =>
      text().map(const UserConverter()).nullable()();

  @override
  Set<Column> get primaryKey => {id};

}
class UserEntity{
  final int? id;
  final String? accessToken;
  final String? refreshToken;
  final UserModel? user;

  UserEntity({ this.id,  this.accessToken,  this.refreshToken,  this.user});

}

class UserConverter extends TypeConverter<UserModel, String> {
  const UserConverter();

  @override
  UserModel fromSql(String fromDb) {
    return UserModel.fromJson(jsonDecode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(UserModel value) {
    return jsonEncode(value.toJson());
  }


}
