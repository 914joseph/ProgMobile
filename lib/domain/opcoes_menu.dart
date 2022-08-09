import 'package:flutter/material.dart';
import 'package:progmobile/screens/cadastrar_medico.dart';
import 'package:progmobile/screens/cadastrar_plantao.dart';

class OpcoesMenu {
  final String opcao;
  final String icon;
  final bool boolfuncao;

  const OpcoesMenu({
    Key? key,
    required this.opcao,
    required this.icon,
    required this.boolfuncao,
  });
}