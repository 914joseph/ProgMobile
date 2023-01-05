import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import '../data/address_api.dart';
import '../domain/address.dart';
import '../widget/dados_usuario_card.dart';
import '../domain/dados_usuario.dart';
import '../data/BD.dart';
import 'home_page.dart';

class CadastrarMedico extends StatefulWidget {
  const CadastrarMedico({Key? key}) : super(key: key);

  @override
  _CadastrarMedicoState createState() => _CadastrarMedicoState();

}

class _CadastrarMedicoState extends State<CadastrarMedico> {
  TextEditingController cepController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController bairroController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController crmController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController especializacaoController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  Future<void> apicall() async {
    String cep = cepController.text;
    print(cep);
    Address address = await AddressApi().findAddressByCep(cep);

    addressController.text = address.logradouro;
    bairroController.text = address.bairro;
    setState(() {
      bairroController = bairroController;
      addressController = addressController;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.lightGreen[200],
        leading: IconButton(
          icon: Icon(
              Icons.arrow_back), //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          color: Colors.black, //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                HomePage()), (Route<dynamic> route) => false);
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
              ),
              Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 8),
                  child: Container(
                    width: double.infinity,
                    child: Text("Cadastrar Médico",
                        style: TextStyle(fontSize: 30.0)),
                  )),
              Form(
                key: _formkey,
                child: Column(
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
                                child: TextFormField(
                                  controller: nomeController,
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
                        Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                            child: Text('CEP:', style: TextStyle(fontSize: 20))),
                        Expanded(
                            child: Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(8, 0, 0, 8),
                                child: TextFormField(
                                  controller: cepController,
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
                        Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                            child: Text('Bairro:', style: TextStyle(fontSize: 20))),
                        Expanded(
                            child: Padding(
                                padding:
                                EdgeInsetsDirectional.fromSTEB(8, 0, 0, 8),
                                child: TextFormField(
                                  controller: bairroController,
                                  enabled: false,
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
                                child: TextFormField(
                                  controller: addressController,
                                  enabled: false,
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
                                child: TextFormField(
                                  controller: cpfController,
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
                                child: TextFormField(
                                  controller: crmController,
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
                                child: TextFormField(
                                  controller: telefoneController,
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
                                child: TextFormField(
                                  controller: especializacaoController,
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
                        padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
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
                                onPressed: apicall,
                                child: const Text('Salvar', style: TextStyle(color: Colors.black)),
                              ),
                              SizedBox(height: 24),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    textStyle: const TextStyle(fontSize: 20),
                                    primary: Colors.grey[350],
                                    shape: StadiumBorder(),
                                    side: BorderSide(
                                        width: 1, color: Colors.black)),
                                onPressed: () {
                                  //o que vai retornar no botão
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));
                                },
                                child: const Text('Sair',
                                    style: TextStyle(color: Colors.black)),
                              )
                            ]
                        )
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
