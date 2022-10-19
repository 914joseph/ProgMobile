import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    String databasePath = join(path, "projeto.db");
    Database db = await openDatabase(
      databasePath,
      version: 1,
      onCreate: onCreate,
    );

    print(databasePath);
    return db;
  }

  Future<FutureOr<void>> onCreate(Database db, int version) async {

    String sql = 'create table BANCO (id INTEGER PRIMARY KEY, cpf varchar(9), senha varchar(100));';
    await db.execute(sql);

    sql = "INSERT INTO BANCO (id, cpf, senha) VALUES (1, '123456789', 'senha');";
    await db.execute(sql);
  }
}