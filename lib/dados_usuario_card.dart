import 'package:flutter/material.dart';
import 'package:progmobile/dados_usuario_card.dart';

class DadosUsuarioCard extends StatefulWidget {
  final String nome;
  final String cpf;
  final String entrada;
  final String situacao;

  const DadosUsuarioCard({
    Key? key,
    required this.nome,
    required this.cpf,
    required this.entrada,
    required this.situacao,
  }) : super(key: key);

  @override
  _DadosUsuarioCardState createState() => _DadosUsuarioCardState();
}

class _DadosUsuarioCardState extends State<DadosUsuarioCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 60,
        width: double.maxFinite,
        decoration: BoxDecoration(
          border: Border.all(width: 4),
          color: const Color(0xFFA6A6A6),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*Expanded(*/
            /*flex: 1,*/
            /*child: */ Padding(
              padding: EdgeInsetsDirectional.fromSTEB(14, 0, 0, 0),
              child: Center(
                child: Container(
                  child: const Icon(Icons.person),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    color: const Color(0xFFA6A6A6),
                  ),
                ),
              ),
            ),
            /*),*/
            Expanded(
                child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 6, 0, 0),
                    child: Row(
                      children: [
                        Expanded(
                            child: Column(
                              children: [
                                Expanded(
                                    child: Text(
                                      'Nome:  ${widget.nome}',
                                      style: TextStyle(fontSize: 12.0),
                                    )),
                                Expanded(
                                    child: Text(
                                      'CPF:  ${widget.cpf}',
                                      style: TextStyle(fontSize: 12.0),
                                    )),
                              ],
                            )),
                        Expanded(
                            child: Column(children: [
                              Expanded(
                                  child: Text(
                                    'Entrada:  ${widget.entrada}',
                                    style: TextStyle(fontSize: 12.0),
                                  )),
                              Expanded(
                                  child: Text(
                                    'Situação:  ${widget.situacao}',
                                    style: TextStyle(fontSize: 12.0),
                                  )),
                            ])),
                      ],
                    )))
          ],
        ),
      ),
    );
  }
}
