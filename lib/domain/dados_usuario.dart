import 'package:flutter/material.dart';

class Usuario{
  late final String nome;
  late final String cpf;
  late final String entrada;
  late final String situacao;
  late final String imagem;
  late final String? senha;

  Usuario({
    Key? key,
    required this.nome,
    required this.cpf,
    required this.entrada,
    required this.situacao,
    required this.imagem,
    required this.senha
  });

  Map<String, Object?> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['cpf'] = cpf;
    data['senha'] = nome;


    return data;
  }

  Usuario.fromJson(Map<String, dynamic> json) {
    cpf = json['cpf'];
    senha = json['senha'];

  }

// @override
// _DadosUsuarioCardState createState() => _DadosUsuarioCardState();
}
