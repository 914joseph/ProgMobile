import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:progmobile/cadastrar_medico.dart';
import 'package:progmobile/cadastrar_plantao.dart';

class DadosMenuCard extends StatefulWidget {
  final String opcao;
  final String icon;
  final bool boolfuncao;

  const DadosMenuCard({
    Key? key,
    required this.opcao,
    required this.boolfuncao,
    required this.icon,
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
                        child: Image.network(widget.icon),
                      ),
                      SizedBox(width: 16),
                      Text(
                        widget.opcao,
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
                  widget.boolfuncao ? Navigator.push(context, MaterialPageRoute(builder: (context) => CadastrarPlantao())) : Navigator.push(context, MaterialPageRoute(builder: (context) => CadastrarMedico()));


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
