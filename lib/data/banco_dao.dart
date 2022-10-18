import 'dart:convert';

import 'package:progmobile/data/db_helper.dart';
import 'package:progmobile/domain/dados_usuario.dart';
import 'package:sqflite/sqlite_api.dart';

class Dao {

  Future<List<Usuario>> listarUsuarios() async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    String sql = 'SELECT * FROM banco';
    var result = await db.rawQuery(sql);

    List<Usuario> lista = <Usuario>[];
    for (var json in result) {
      Usuario banco = Usuario.fromJson(json);
      lista.add(banco);
    }

    return lista;
  }

}