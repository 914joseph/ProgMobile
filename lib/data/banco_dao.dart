import 'dart:convert';

import 'package:progmobile/data/db_helper.dart';
import 'package:progmobile/domain/dados_usuario.dart';
import 'package:sqflite/sqlite_api.dart';

class Dao {

  salvarUser({required Usuario usuario}) async {

    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    db.insert('banco', usuario.toJson());

  }
  Future<bool> autenticar({required String cpf, required String senha}) async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    String sql = "SELECT * "
        "FROM BANCO "
        "WHERE CPF = ? AND SENHA = ?";

    final result = await db.rawQuery(sql, [cpf, senha]);
    return result.isNotEmpty;
  }
  Future<bool> superautenticar({required String cpf}) async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    String sql = "SELECT * "
        "FROM BANCO "
        "WHERE CPF = ?";

    final result = await db.rawQuery(sql, [cpf]);
    return result.isNotEmpty;
  }

}