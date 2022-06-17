import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste/dados_usuario_card.dart';

class Cabecalho extends StatefulWidget {
  const Cabecalho({Key? key}) : super(key: key);

  @override
  _Cabecalho createState() => _Cabecalho();
}

class _Cabecalho extends State<Cabecalho> {
  bool isChecked = false;
  bool isChecked1 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.lightGreen[200],
          title: Text('SISTEMA GERENCIADOR \n DE PLANTÃO', style: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: CircleAvatar(radius: 30, backgroundImage: NetworkImage('data:image/jpeg;base64,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')),
            )
          ],
        ),
        backgroundColor: Colors.lightGreen[200],
        body: Padding(
            padding: const EdgeInsets.all(8),
            child: ListView(children: [
              const DadosUsuarioCard(
                nome: '**************',
                entrada: '**********',
                cpf: '*************',
                situacao: '**************',
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text(
                            'Cadastrar Plantão',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ], // Children
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                            child: Text(
                              'Nome do Médico:*',
                              style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(8),
                                isDense: true,
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                            child: Text(
                              'CPF:*',
                              style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                            child: TextField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(8),
                                isDense: true,
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2), child: Text('Data do Plantão:*', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
                              const SizedBox(height: 30),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: '**/**/****',
                                    hintStyle: TextStyle(fontWeight: FontWeight.bold),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(8),
                                    isDense: true,
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                  // style: TextStyle(fontSize: 40.0, height: 0, color: Colors.black)
                                ),
                              )
                            ],
                            // Children
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2), child: Text('Horário Plantão:*', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
                              const SizedBox(height: 30),
                              Expanded(
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: '**:**h',
                                    hintStyle: TextStyle(fontWeight: FontWeight.bold),
                                    contentPadding: EdgeInsets.all(8),
                                    isDense: true,
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                  // style: TextStyle(fontSize: 40.0, height: 0, color: Colors.black)
                                ),
                              )
                            ], // Children
                          ),
                          SizedBox(height: 20),
                          Align(
                            alignment: Alignment.center,
                            child: Text('Tempo de Plantão', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10.0),
                                      child: new Checkbox(
                                          tristate: true,
                                          value: isChecked ? true : null,
                                          checkColor: isChecked ? Colors.black : Colors.transparent,
                                          side: MaterialStateBorderSide.resolveWith(
                                            (states) => const BorderSide(color: Colors.white),
                                          ),
                                          fillColor: MaterialStateProperty.all(Colors.white),
                                          onChanged: (bool? value) {
                                            setState(() {
                                              isChecked = !isChecked;
                                            });
                                          }),
                                    ),
                                    Text('24H', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              Center(
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10.0),
                                      child: new Checkbox(
                                          tristate: true,
                                          value: isChecked1 ? true : null,
                                          checkColor: isChecked1 ? Colors.black : Colors.transparent,
                                          side: MaterialStateBorderSide.resolveWith(
                                            (states) => const BorderSide(color: Colors.white),
                                          ),
                                          fillColor: MaterialStateProperty.all(Colors.white),
                                          onChanged: (bool? value) {
                                            setState(() {
                                              isChecked1 = !isChecked1;
                                            });
                                          }),
                                    ),
                                    Text('12H', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 50),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: null,
                                      child: const Text(
                                        'Cadastrar',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                      style: TextButton.styleFrom(shape: StadiumBorder(), backgroundColor: Color(0xFFFb0bec5), side: BorderSide(width: 3.0, color: Color(0xFFF90a4ae))),
                                    )
                                  ], // Children
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ])));
  }
}
