import 'dart:typed_data';
import 'package:progmobile/domain/opcoes_menu.dart';
import 'package:flutter/material.dart';
import 'package:progmobile/screens/cadastrar_medico.dart';
import 'package:progmobile/screens/cadastrar_plantao.dart';
import 'package:progmobile/screens/list_page.dart';
import 'package:progmobile/screens/listagem_plantoes.dart';

class DadosMenuCard extends StatefulWidget {
  final OpcoesMenu dadosOpcoesMenu;

  const DadosMenuCard({
    Key? key,
    required this.dadosOpcoesMenu
  }) : super(key: key);

  @override
  _DadosMenuCardState createState() => _DadosMenuCardState();
}

class _DadosMenuCardState extends State<DadosMenuCard> {

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Container(
        height: 45,
        width: double.maxFinite,
        decoration: BoxDecoration(
          border: Border.all(
            width: 4,
            color: const Color(0xFF78909c),
          ),
          color: const Color(0xFFe0e0e0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                margin: const EdgeInsets.all(8),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      Center(
                        child: Image.network(widget.dadosOpcoesMenu.icon),
                      ),
                      SizedBox(width: 16),
                      Text(
                        widget.dadosOpcoesMenu.opcao,
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4),
              child: ElevatedButton(
                onPressed: () {
                  widget.dadosOpcoesMenu.boolfuncao ? Navigator.push(context, MaterialPageRoute(builder: (context) => CadastrarPlantao())) : Navigator.push(context, MaterialPageRoute(builder: (context) => CadastrarMedico()));
                  if (widget.dadosOpcoesMenu.index == 1){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CadastrarPlantao()));
                  } else if (widget.dadosOpcoesMenu.index == 2){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CadastrarMedico()));
                  } else if (widget.dadosOpcoesMenu.index == 3){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ListPage()));
                  }

                },
                child: Icon(Icons.send, size: 15, color: Colors.black),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(width: 1.0, color: Colors.black),
                  shape: CircleBorder(), primary: Colors.black, backgroundColor: Colors.grey, // <-- Button color
                  // <-- Splash color
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
