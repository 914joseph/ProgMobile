import 'package:flutter/material.dart';

class Usuario{
  final String nome;
  final String cpf;
  final String entrada;
  final String situacao;
  final String imagem;

  const Usuario({
    Key? key,
    required this.nome,
    required this.cpf,
    required this.entrada,
    required this.situacao,
    required this.imagem
  });



// @override
// _DadosUsuarioCardState createState() => _DadosUsuarioCardState();
}
