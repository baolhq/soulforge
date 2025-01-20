// db.dart
//
// Database helpers and functionalities for persistance storage.
import 'package:flutter/material.dart';
import 'package:sqlite3/sqlite3.dart';

class DbContext {
  late final Database _database;

  /// Open the database connection
  void open(String path) {
    _database = sqlite3.open(path);
    debugPrint("Database opened at $path");
  }

  /// Close the connection
  void close() {
    _database.dispose();
    debugPrint("Database closed");
  }

  /// Create a new table
  void createTable(String sql) {
    _database.execute(sql);
    debugPrint('Table created');
  }

  /// Insert a record
  int insert(String sql, List<dynamic> params) {
    final statement = _database.prepare(sql);
    statement.execute(params);
    final insertedId = _database.lastInsertRowId;
    statement.dispose();
    debugPrint('Record inserted with ID: $insertedId');
    return insertedId;
  }

  /// Query record
  List<Map<String, dynamic>> query(String sql, [List<dynamic>? params]) {
    final statement = _database.prepare(sql);
    final ResultSet resultSet = statement.select(params ?? []);

    final columnNames = resultSet.columnNames;
    final results = resultSet.map((row) {
      return {for (var columnName in columnNames) columnName: row[columnName]};
    }).toList();

    statement.dispose();
    debugPrint('Query executed, ${results.length} records found');
    return results;
  }

  /// Update records
  int update(String sql, List<dynamic> params) {
    final statement = _database.prepare(sql);
    statement.execute(params);
    final updatedRows = _database.updatedRows;
    statement.dispose();
    debugPrint('$updatedRows records updated');
    return updatedRows;
  }

  /// Delete records
  int delete(String sql, List<dynamic> params) {
    final statement = _database.prepare(sql);
    statement.execute(params);
    final deletedRows = _database.updatedRows;
    statement.dispose();
    debugPrint('$deletedRows records deleted');
    return deletedRows;
  }

  /// Initialize the database
  void init() {
    var weapons = {
      "id": "INTEGER PRIMARY KEY AUTOINCREMENT",
      "name": "TEXT",
      "damage": "INTEGER",
      "type": "TEXT",
    };
    var weaponSql = initStringBuilder("weapons", weapons);
    _database.execute(weaponSql);
  }

  /// Build a SQL query to create table
  String initStringBuilder(String name, Map<String, String> fields) {
    final sql = fields.entries.map((e) => '${e.key} ${e.value}').join(', ');
    return "CREATE TABLE IF NOT EXISTS $name ($sql)";
  }
}
