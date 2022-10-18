import 'package:progmobile/domain/dados_usuario.dart';

class BD {
  static List<Usuario> listaUsuarios = [

  ];

  static Future<List<Usuario>>  listarUsuarios() async {
    print("ANTES");
    await Future.delayed(const Duration(seconds: 5));
    print("DEPOIS");
    return listaUsuarios;
  }
}