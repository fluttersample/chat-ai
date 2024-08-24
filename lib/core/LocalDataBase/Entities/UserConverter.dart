

import 'dart:convert';

import 'package:ai_test/core/Dto/Models/Login/LoginResponseModel.dart';
import 'package:drift/drift.dart';

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