import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import '../widget/dados_usuario_card.dart';
import '../domain/dados_usuario.dart';
import '../data/BD.dart';

class CadastrarMedico extends StatefulWidget {
  const CadastrarMedico({Key? key}) : super(key: key);

  @override
  _CadastrarMedicoState createState() => _CadastrarMedicoState();
}

class _CadastrarMedicoState extends State<CadastrarMedico> {
  bool saved = false; //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

  Future<bool?> showConfirmationDialog (){
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Desejea sair sem salvar?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancelar'),
              ),
              OutlinedButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('Sair'),
              ),
            ],
          );

        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope (
      onWillPop: () async {
        //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        if (!saved) {
          final confirmation = await showConfirmationDialog();//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          return confirmation ?? false; //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        }
        return true; //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      },
      child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.lightGreen[200],
        leading: IconButton(
          //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            icon: Icon(Icons
                .arrow_back), //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            color:
            Colors.black, //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('SISTEMA GERENCIADOR \n DE PLANTÃO',
            style: const TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
        actions: <Widget>[
          CircleAvatar(radius: 32,
            backgroundImage: AssetImage("assets/images/logoo.png"),
          ),
        ],
      ),
      backgroundColor: Colors.lightGreen[200],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: ListView(
            children: [
              DadosUsuarioCard(
                dadosCard: Usuario(
                    nome: BD.listaUsuario[2].dadosCard.nome,
                    cpf: BD.listaUsuario[2].dadosCard.cpf,
                    imagem: BD.listaUsuario[2].dadosCard.imagem,
                    entrada: BD.listaUsuario[2].dadosCard.entrada,
                    situacao: BD.listaUsuario[2].dadosCard.situacao,
                senha: null),
              )
              /*Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image.network(
                      'https://picsum.photos/seed/172/600',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text('opção1'),
                                  ),
                                  Expanded(
                                    child: Text('opção2'),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text('opção3'),
                                  ),
                                  Expanded(
                                    child: Text('opção4'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )*/
              ,
              Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                  child: Container(
                    width: double.infinity,
                    child: Text("Cadastrar Médico",
                        style: TextStyle(fontSize: 30.0)),
                  )),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                          child: Text('Nome:', style: TextStyle(fontSize: 20))),
                      Expanded(
                          child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 0, 8),
                              child: TextField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(8),
                                  isDense: true,
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                // style: TextStyle(fontSize: 40.0, height: 0, color: Colors.black)
                              )))
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text('Endereço:', style: TextStyle(fontSize: 20)),
                      Expanded(
                          child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 0, 15),
                              child: TextField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(8),
                                  isDense: true,
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                // style: TextStyle(fontSize: 40.0, height: 0, color: Colors.black)
                              )))
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text('CPF:', style: TextStyle(fontSize: 20)),
                      Expanded(
                          child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 0, 15),
                              child: TextField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(8),
                                  isDense: true,
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                // style: TextStyle(fontSize: 40.0, height: 0, color: Colors.black)
                              )))
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text('CRM:', style: TextStyle(fontSize: 20)),
                      Expanded(
                          child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 0, 15),
                              child: TextField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(8),
                                  isDense: true,
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                // style: TextStyle(fontSize: 40.0, height: 0, color: Colors.black)
                              )))
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text('Telefone:', style: TextStyle(fontSize: 20)),
                      Expanded(
                          child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 0, 15),
                              child: TextField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(8),
                                  isDense: true,
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                // style: TextStyle(fontSize: 40.0, height: 0, color: Colors.black)
                              )))
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text('Especialização:', style: TextStyle(fontSize: 20)),
                      Expanded(
                          child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                              child: TextField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(8),
                                  isDense: true,
                                  border: InputBorder.none,
                                  filled: true,
                                  fillColor: Colors.white,
                                ),
                                // style: TextStyle(fontSize: 40.0, height: 0, color: Colors.black)
                              )))
                    ],
                  ),
                  Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 90, 0, 0),
                      child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  textStyle: const TextStyle(fontSize: 20),
                                  primary: Colors.grey[350],
                                  shape: StadiumBorder(),
                                  side: BorderSide(
                                      width: 1, color: Colors.black)),
                              onPressed: () {
                                saved = true;
                                //o que vai retornar no botão
                                Navigator.pop( // Trocar !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
                                  //não ficar no lixo de memória
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const CadastrarMedico();
                                    },
                                  ),
                                );
                              },
                              child: const Text('Salvar',
                                  style: TextStyle(color: Colors.black)),
                            )
                          ]))
                ],
              )
            ],
          ),
        ),
      ),
      ),
    );
  }
}
