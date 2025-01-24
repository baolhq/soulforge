// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $AreasTable extends Areas with TableInfo<$AreasTable, Area> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AreasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'areas';
  @override
  VerificationContext validateIntegrity(Insertable<Area> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Area map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Area(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
    );
  }

  @override
  $AreasTable createAlias(String alias) {
    return $AreasTable(attachedDatabase, alias);
  }
}

class Area extends DataClass implements Insertable<Area> {
  final int id;
  final String name;
  final String? description;
  const Area({required this.id, required this.name, this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  AreasCompanion toCompanion(bool nullToAbsent) {
    return AreasCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory Area.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Area(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
    };
  }

  Area copyWith(
          {int? id,
          String? name,
          Value<String?> description = const Value.absent()}) =>
      Area(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
      );
  Area copyWithCompanion(AreasCompanion data) {
    return Area(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Area(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Area &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description);
}

class AreasCompanion extends UpdateCompanion<Area> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  const AreasCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
  });
  AreasCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Area> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
    });
  }

  AreasCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String?>? description}) {
    return AreasCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AreasCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $RacesTable extends Races with TableInfo<$RacesTable, Race> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RacesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _perkMeta = const VerificationMeta('perk');
  @override
  late final GeneratedColumn<String> perk = GeneratedColumn<String>(
      'perk', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, perk, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'races';
  @override
  VerificationContext validateIntegrity(Insertable<Race> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('perk')) {
      context.handle(
          _perkMeta, perk.isAcceptableOrUnknown(data['perk']!, _perkMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Race map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Race(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      perk: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}perk']),
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
    );
  }

  @override
  $RacesTable createAlias(String alias) {
    return $RacesTable(attachedDatabase, alias);
  }
}

class Race extends DataClass implements Insertable<Race> {
  final int id;
  final String name;
  final String? perk;
  final String? description;
  const Race(
      {required this.id, required this.name, this.perk, this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || perk != null) {
      map['perk'] = Variable<String>(perk);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    return map;
  }

  RacesCompanion toCompanion(bool nullToAbsent) {
    return RacesCompanion(
      id: Value(id),
      name: Value(name),
      perk: perk == null && nullToAbsent ? const Value.absent() : Value(perk),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
    );
  }

  factory Race.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Race(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      perk: serializer.fromJson<String?>(json['perk']),
      description: serializer.fromJson<String?>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'perk': serializer.toJson<String?>(perk),
      'description': serializer.toJson<String?>(description),
    };
  }

  Race copyWith(
          {int? id,
          String? name,
          Value<String?> perk = const Value.absent(),
          Value<String?> description = const Value.absent()}) =>
      Race(
        id: id ?? this.id,
        name: name ?? this.name,
        perk: perk.present ? perk.value : this.perk,
        description: description.present ? description.value : this.description,
      );
  Race copyWithCompanion(RacesCompanion data) {
    return Race(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      perk: data.perk.present ? data.perk.value : this.perk,
      description:
          data.description.present ? data.description.value : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Race(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('perk: $perk, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, perk, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Race &&
          other.id == this.id &&
          other.name == this.name &&
          other.perk == this.perk &&
          other.description == this.description);
}

class RacesCompanion extends UpdateCompanion<Race> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> perk;
  final Value<String?> description;
  const RacesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.perk = const Value.absent(),
    this.description = const Value.absent(),
  });
  RacesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.perk = const Value.absent(),
    this.description = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Race> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? perk,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (perk != null) 'perk': perk,
      if (description != null) 'description': description,
    });
  }

  RacesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? perk,
      Value<String?>? description}) {
    return RacesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      perk: perk ?? this.perk,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (perk.present) {
      map['perk'] = Variable<String>(perk.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RacesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('perk: $perk, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $EventLogsTable extends EventLogs
    with TableInfo<$EventLogsTable, EventLog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EventLogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _detailsMeta =
      const VerificationMeta('details');
  @override
  late final GeneratedColumn<String> details = GeneratedColumn<String>(
      'details', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _timestampMeta =
      const VerificationMeta('timestamp');
  @override
  late final GeneratedColumn<DateTime> timestamp = GeneratedColumn<DateTime>(
      'timestamp', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: Constant(DateTime.now()));
  @override
  List<GeneratedColumn> get $columns => [id, type, details, timestamp];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'event_logs';
  @override
  VerificationContext validateIntegrity(Insertable<EventLog> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('details')) {
      context.handle(_detailsMeta,
          details.isAcceptableOrUnknown(data['details']!, _detailsMeta));
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EventLog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EventLog(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      details: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}details']),
      timestamp: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}timestamp'])!,
    );
  }

  @override
  $EventLogsTable createAlias(String alias) {
    return $EventLogsTable(attachedDatabase, alias);
  }
}

class EventLog extends DataClass implements Insertable<EventLog> {
  final int id;
  final String type;
  final String? details;
  final DateTime timestamp;
  const EventLog(
      {required this.id,
      required this.type,
      this.details,
      required this.timestamp});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['type'] = Variable<String>(type);
    if (!nullToAbsent || details != null) {
      map['details'] = Variable<String>(details);
    }
    map['timestamp'] = Variable<DateTime>(timestamp);
    return map;
  }

  EventLogsCompanion toCompanion(bool nullToAbsent) {
    return EventLogsCompanion(
      id: Value(id),
      type: Value(type),
      details: details == null && nullToAbsent
          ? const Value.absent()
          : Value(details),
      timestamp: Value(timestamp),
    );
  }

  factory EventLog.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EventLog(
      id: serializer.fromJson<int>(json['id']),
      type: serializer.fromJson<String>(json['type']),
      details: serializer.fromJson<String?>(json['details']),
      timestamp: serializer.fromJson<DateTime>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'type': serializer.toJson<String>(type),
      'details': serializer.toJson<String?>(details),
      'timestamp': serializer.toJson<DateTime>(timestamp),
    };
  }

  EventLog copyWith(
          {int? id,
          String? type,
          Value<String?> details = const Value.absent(),
          DateTime? timestamp}) =>
      EventLog(
        id: id ?? this.id,
        type: type ?? this.type,
        details: details.present ? details.value : this.details,
        timestamp: timestamp ?? this.timestamp,
      );
  EventLog copyWithCompanion(EventLogsCompanion data) {
    return EventLog(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      details: data.details.present ? data.details.value : this.details,
      timestamp: data.timestamp.present ? data.timestamp.value : this.timestamp,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EventLog(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('details: $details, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, type, details, timestamp);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EventLog &&
          other.id == this.id &&
          other.type == this.type &&
          other.details == this.details &&
          other.timestamp == this.timestamp);
}

class EventLogsCompanion extends UpdateCompanion<EventLog> {
  final Value<int> id;
  final Value<String> type;
  final Value<String?> details;
  final Value<DateTime> timestamp;
  const EventLogsCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.details = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  EventLogsCompanion.insert({
    this.id = const Value.absent(),
    required String type,
    this.details = const Value.absent(),
    this.timestamp = const Value.absent(),
  }) : type = Value(type);
  static Insertable<EventLog> custom({
    Expression<int>? id,
    Expression<String>? type,
    Expression<String>? details,
    Expression<DateTime>? timestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (details != null) 'details': details,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  EventLogsCompanion copyWith(
      {Value<int>? id,
      Value<String>? type,
      Value<String?>? details,
      Value<DateTime>? timestamp}) {
    return EventLogsCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      details: details ?? this.details,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (details.present) {
      map['details'] = Variable<String>(details.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<DateTime>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EventLogsCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('details: $details, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $AreasTable areas = $AreasTable(this);
  late final $RacesTable races = $RacesTable(this);
  late final $EventLogsTable eventLogs = $EventLogsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [areas, races, eventLogs];
}

typedef $$AreasTableCreateCompanionBuilder = AreasCompanion Function({
  Value<int> id,
  required String name,
  Value<String?> description,
});
typedef $$AreasTableUpdateCompanionBuilder = AreasCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String?> description,
});

class $$AreasTableFilterComposer extends Composer<_$Database, $AreasTable> {
  $$AreasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));
}

class $$AreasTableOrderingComposer extends Composer<_$Database, $AreasTable> {
  $$AreasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));
}

class $$AreasTableAnnotationComposer extends Composer<_$Database, $AreasTable> {
  $$AreasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);
}

class $$AreasTableTableManager extends RootTableManager<
    _$Database,
    $AreasTable,
    Area,
    $$AreasTableFilterComposer,
    $$AreasTableOrderingComposer,
    $$AreasTableAnnotationComposer,
    $$AreasTableCreateCompanionBuilder,
    $$AreasTableUpdateCompanionBuilder,
    (Area, BaseReferences<_$Database, $AreasTable, Area>),
    Area,
    PrefetchHooks Function()> {
  $$AreasTableTableManager(_$Database db, $AreasTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AreasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AreasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AreasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
          }) =>
              AreasCompanion(
            id: id,
            name: name,
            description: description,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> description = const Value.absent(),
          }) =>
              AreasCompanion.insert(
            id: id,
            name: name,
            description: description,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AreasTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $AreasTable,
    Area,
    $$AreasTableFilterComposer,
    $$AreasTableOrderingComposer,
    $$AreasTableAnnotationComposer,
    $$AreasTableCreateCompanionBuilder,
    $$AreasTableUpdateCompanionBuilder,
    (Area, BaseReferences<_$Database, $AreasTable, Area>),
    Area,
    PrefetchHooks Function()>;
typedef $$RacesTableCreateCompanionBuilder = RacesCompanion Function({
  Value<int> id,
  required String name,
  Value<String?> perk,
  Value<String?> description,
});
typedef $$RacesTableUpdateCompanionBuilder = RacesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String?> perk,
  Value<String?> description,
});

class $$RacesTableFilterComposer extends Composer<_$Database, $RacesTable> {
  $$RacesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get perk => $composableBuilder(
      column: $table.perk, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));
}

class $$RacesTableOrderingComposer extends Composer<_$Database, $RacesTable> {
  $$RacesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get perk => $composableBuilder(
      column: $table.perk, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));
}

class $$RacesTableAnnotationComposer extends Composer<_$Database, $RacesTable> {
  $$RacesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get perk =>
      $composableBuilder(column: $table.perk, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);
}

class $$RacesTableTableManager extends RootTableManager<
    _$Database,
    $RacesTable,
    Race,
    $$RacesTableFilterComposer,
    $$RacesTableOrderingComposer,
    $$RacesTableAnnotationComposer,
    $$RacesTableCreateCompanionBuilder,
    $$RacesTableUpdateCompanionBuilder,
    (Race, BaseReferences<_$Database, $RacesTable, Race>),
    Race,
    PrefetchHooks Function()> {
  $$RacesTableTableManager(_$Database db, $RacesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RacesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RacesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RacesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> perk = const Value.absent(),
            Value<String?> description = const Value.absent(),
          }) =>
              RacesCompanion(
            id: id,
            name: name,
            perk: perk,
            description: description,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> perk = const Value.absent(),
            Value<String?> description = const Value.absent(),
          }) =>
              RacesCompanion.insert(
            id: id,
            name: name,
            perk: perk,
            description: description,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$RacesTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $RacesTable,
    Race,
    $$RacesTableFilterComposer,
    $$RacesTableOrderingComposer,
    $$RacesTableAnnotationComposer,
    $$RacesTableCreateCompanionBuilder,
    $$RacesTableUpdateCompanionBuilder,
    (Race, BaseReferences<_$Database, $RacesTable, Race>),
    Race,
    PrefetchHooks Function()>;
typedef $$EventLogsTableCreateCompanionBuilder = EventLogsCompanion Function({
  Value<int> id,
  required String type,
  Value<String?> details,
  Value<DateTime> timestamp,
});
typedef $$EventLogsTableUpdateCompanionBuilder = EventLogsCompanion Function({
  Value<int> id,
  Value<String> type,
  Value<String?> details,
  Value<DateTime> timestamp,
});

class $$EventLogsTableFilterComposer
    extends Composer<_$Database, $EventLogsTable> {
  $$EventLogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get details => $composableBuilder(
      column: $table.details, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnFilters(column));
}

class $$EventLogsTableOrderingComposer
    extends Composer<_$Database, $EventLogsTable> {
  $$EventLogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get details => $composableBuilder(
      column: $table.details, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get timestamp => $composableBuilder(
      column: $table.timestamp, builder: (column) => ColumnOrderings(column));
}

class $$EventLogsTableAnnotationComposer
    extends Composer<_$Database, $EventLogsTable> {
  $$EventLogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get details =>
      $composableBuilder(column: $table.details, builder: (column) => column);

  GeneratedColumn<DateTime> get timestamp =>
      $composableBuilder(column: $table.timestamp, builder: (column) => column);
}

class $$EventLogsTableTableManager extends RootTableManager<
    _$Database,
    $EventLogsTable,
    EventLog,
    $$EventLogsTableFilterComposer,
    $$EventLogsTableOrderingComposer,
    $$EventLogsTableAnnotationComposer,
    $$EventLogsTableCreateCompanionBuilder,
    $$EventLogsTableUpdateCompanionBuilder,
    (EventLog, BaseReferences<_$Database, $EventLogsTable, EventLog>),
    EventLog,
    PrefetchHooks Function()> {
  $$EventLogsTableTableManager(_$Database db, $EventLogsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EventLogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EventLogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EventLogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String?> details = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
          }) =>
              EventLogsCompanion(
            id: id,
            type: type,
            details: details,
            timestamp: timestamp,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String type,
            Value<String?> details = const Value.absent(),
            Value<DateTime> timestamp = const Value.absent(),
          }) =>
              EventLogsCompanion.insert(
            id: id,
            type: type,
            details: details,
            timestamp: timestamp,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$EventLogsTableProcessedTableManager = ProcessedTableManager<
    _$Database,
    $EventLogsTable,
    EventLog,
    $$EventLogsTableFilterComposer,
    $$EventLogsTableOrderingComposer,
    $$EventLogsTableAnnotationComposer,
    $$EventLogsTableCreateCompanionBuilder,
    $$EventLogsTableUpdateCompanionBuilder,
    (EventLog, BaseReferences<_$Database, $EventLogsTable, EventLog>),
    EventLog,
    PrefetchHooks Function()>;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$AreasTableTableManager get areas =>
      $$AreasTableTableManager(_db, _db.areas);
  $$RacesTableTableManager get races =>
      $$RacesTableTableManager(_db, _db.races);
  $$EventLogsTableTableManager get eventLogs =>
      $$EventLogsTableTableManager(_db, _db.eventLogs);
}
