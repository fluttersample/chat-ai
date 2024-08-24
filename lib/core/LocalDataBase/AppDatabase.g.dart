// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppDatabase.dart';

// ignore_for_file: type=lint
class $UserDbTable extends UserDb with TableInfo<$UserDbTable, UserDbData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserDbTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _accessTokenMeta =
      const VerificationMeta('accessToken');
  @override
  late final GeneratedColumn<String> accessToken = GeneratedColumn<String>(
      'access_token', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _refreshTokenMeta =
      const VerificationMeta('refreshToken');
  @override
  late final GeneratedColumn<String> refreshToken = GeneratedColumn<String>(
      'refresh_token', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _userMeta = const VerificationMeta('user');
  @override
  late final GeneratedColumnWithTypeConverter<UserModel?, String> user =
      GeneratedColumn<String>('user', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<UserModel?>($UserDbTable.$converterusern);
  @override
  List<GeneratedColumn> get $columns => [id, accessToken, refreshToken, user];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_db';
  @override
  VerificationContext validateIntegrity(Insertable<UserDbData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('access_token')) {
      context.handle(
          _accessTokenMeta,
          accessToken.isAcceptableOrUnknown(
              data['access_token']!, _accessTokenMeta));
    }
    if (data.containsKey('refresh_token')) {
      context.handle(
          _refreshTokenMeta,
          refreshToken.isAcceptableOrUnknown(
              data['refresh_token']!, _refreshTokenMeta));
    } else if (isInserting) {
      context.missing(_refreshTokenMeta);
    }
    context.handle(_userMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserDbData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserDbData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      accessToken: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}access_token']),
      refreshToken: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}refresh_token'])!,
      user: $UserDbTable.$converterusern.fromSql(attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user'])),
    );
  }

  @override
  $UserDbTable createAlias(String alias) {
    return $UserDbTable(attachedDatabase, alias);
  }

  static TypeConverter<UserModel, String> $converteruser =
      const UserConverter();
  static TypeConverter<UserModel?, String?> $converterusern =
      NullAwareTypeConverter.wrap($converteruser);
}

class UserDbData extends DataClass implements Insertable<UserDbData> {
  final int id;
  final String? accessToken;
  final String refreshToken;
  final UserModel? user;
  const UserDbData(
      {required this.id,
      this.accessToken,
      required this.refreshToken,
      this.user});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || accessToken != null) {
      map['access_token'] = Variable<String>(accessToken);
    }
    map['refresh_token'] = Variable<String>(refreshToken);
    if (!nullToAbsent || user != null) {
      map['user'] = Variable<String>($UserDbTable.$converterusern.toSql(user));
    }
    return map;
  }

  UserDbCompanion toCompanion(bool nullToAbsent) {
    return UserDbCompanion(
      id: Value(id),
      accessToken: accessToken == null && nullToAbsent
          ? const Value.absent()
          : Value(accessToken),
      refreshToken: Value(refreshToken),
      user: user == null && nullToAbsent ? const Value.absent() : Value(user),
    );
  }

  factory UserDbData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserDbData(
      id: serializer.fromJson<int>(json['id']),
      accessToken: serializer.fromJson<String?>(json['accessToken']),
      refreshToken: serializer.fromJson<String>(json['refreshToken']),
      user: serializer.fromJson<UserModel?>(json['user']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'accessToken': serializer.toJson<String?>(accessToken),
      'refreshToken': serializer.toJson<String>(refreshToken),
      'user': serializer.toJson<UserModel?>(user),
    };
  }

  UserDbData copyWith(
          {int? id,
          Value<String?> accessToken = const Value.absent(),
          String? refreshToken,
          Value<UserModel?> user = const Value.absent()}) =>
      UserDbData(
        id: id ?? this.id,
        accessToken: accessToken.present ? accessToken.value : this.accessToken,
        refreshToken: refreshToken ?? this.refreshToken,
        user: user.present ? user.value : this.user,
      );
  UserDbData copyWithCompanion(UserDbCompanion data) {
    return UserDbData(
      id: data.id.present ? data.id.value : this.id,
      accessToken:
          data.accessToken.present ? data.accessToken.value : this.accessToken,
      refreshToken: data.refreshToken.present
          ? data.refreshToken.value
          : this.refreshToken,
      user: data.user.present ? data.user.value : this.user,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserDbData(')
          ..write('id: $id, ')
          ..write('accessToken: $accessToken, ')
          ..write('refreshToken: $refreshToken, ')
          ..write('user: $user')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, accessToken, refreshToken, user);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserDbData &&
          other.id == this.id &&
          other.accessToken == this.accessToken &&
          other.refreshToken == this.refreshToken &&
          other.user == this.user);
}

class UserDbCompanion extends UpdateCompanion<UserDbData> {
  final Value<int> id;
  final Value<String?> accessToken;
  final Value<String> refreshToken;
  final Value<UserModel?> user;
  const UserDbCompanion({
    this.id = const Value.absent(),
    this.accessToken = const Value.absent(),
    this.refreshToken = const Value.absent(),
    this.user = const Value.absent(),
  });
  UserDbCompanion.insert({
    this.id = const Value.absent(),
    this.accessToken = const Value.absent(),
    required String refreshToken,
    this.user = const Value.absent(),
  }) : refreshToken = Value(refreshToken);
  static Insertable<UserDbData> custom({
    Expression<int>? id,
    Expression<String>? accessToken,
    Expression<String>? refreshToken,
    Expression<String>? user,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (accessToken != null) 'access_token': accessToken,
      if (refreshToken != null) 'refresh_token': refreshToken,
      if (user != null) 'user': user,
    });
  }

  UserDbCompanion copyWith(
      {Value<int>? id,
      Value<String?>? accessToken,
      Value<String>? refreshToken,
      Value<UserModel?>? user}) {
    return UserDbCompanion(
      id: id ?? this.id,
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      user: user ?? this.user,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (accessToken.present) {
      map['access_token'] = Variable<String>(accessToken.value);
    }
    if (refreshToken.present) {
      map['refresh_token'] = Variable<String>(refreshToken.value);
    }
    if (user.present) {
      map['user'] =
          Variable<String>($UserDbTable.$converterusern.toSql(user.value));
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserDbCompanion(')
          ..write('id: $id, ')
          ..write('accessToken: $accessToken, ')
          ..write('refreshToken: $refreshToken, ')
          ..write('user: $user')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UserDbTable userDb = $UserDbTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [userDb];
}

typedef $$UserDbTableCreateCompanionBuilder = UserDbCompanion Function({
  Value<int> id,
  Value<String?> accessToken,
  required String refreshToken,
  Value<UserModel?> user,
});
typedef $$UserDbTableUpdateCompanionBuilder = UserDbCompanion Function({
  Value<int> id,
  Value<String?> accessToken,
  Value<String> refreshToken,
  Value<UserModel?> user,
});

class $$UserDbTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UserDbTable,
    UserDbData,
    $$UserDbTableFilterComposer,
    $$UserDbTableOrderingComposer,
    $$UserDbTableCreateCompanionBuilder,
    $$UserDbTableUpdateCompanionBuilder> {
  $$UserDbTableTableManager(_$AppDatabase db, $UserDbTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$UserDbTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$UserDbTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> accessToken = const Value.absent(),
            Value<String> refreshToken = const Value.absent(),
            Value<UserModel?> user = const Value.absent(),
          }) =>
              UserDbCompanion(
            id: id,
            accessToken: accessToken,
            refreshToken: refreshToken,
            user: user,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String?> accessToken = const Value.absent(),
            required String refreshToken,
            Value<UserModel?> user = const Value.absent(),
          }) =>
              UserDbCompanion.insert(
            id: id,
            accessToken: accessToken,
            refreshToken: refreshToken,
            user: user,
          ),
        ));
}

class $$UserDbTableFilterComposer
    extends FilterComposer<_$AppDatabase, $UserDbTable> {
  $$UserDbTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get accessToken => $state.composableBuilder(
      column: $state.table.accessToken,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get refreshToken => $state.composableBuilder(
      column: $state.table.refreshToken,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<UserModel?, UserModel, String> get user =>
      $state.composableBuilder(
          column: $state.table.user,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));
}

class $$UserDbTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $UserDbTable> {
  $$UserDbTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get accessToken => $state.composableBuilder(
      column: $state.table.accessToken,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get refreshToken => $state.composableBuilder(
      column: $state.table.refreshToken,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get user => $state.composableBuilder(
      column: $state.table.user,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UserDbTableTableManager get userDb =>
      $$UserDbTableTableManager(_db, _db.userDb);
}
