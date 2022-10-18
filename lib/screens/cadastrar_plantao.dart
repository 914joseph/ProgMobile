import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import '../widget/dados_usuario_card.dart';
import '../domain/dados_usuario.dart';
import '../data/BD.dart';

class CadastrarPlantao extends StatefulWidget {
  const CadastrarPlantao({Key? key}) : super(key: key);

  @override
  _CadastrarPlantaoState createState() => _CadastrarPlantaoState();
}

class _CadastrarPlantaoState extends State<CadastrarPlantao> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool saved = false;

  Future<bool?> showConfirmationDialog() {
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
    return WillPopScope(
      onWillPop: () async {
        if (!saved) {
          final confirmation = await showConfirmationDialog();
          return confirmation ?? false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.lightGreen[200],
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text('SISTEMA GERENCIADOR \n DE PLANTÃO',
              style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
          actions: <Widget>[
            CircleAvatar(
              radius: 32,
              backgroundImage: AssetImage("assets/images/logoo.png"),
            ),
          ],
        ),
        backgroundColor: Colors.lightGreen[200],
        body: Padding(
            padding: const EdgeInsets.all(8),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  DadosUsuarioCard(
                dadosCard: Usuario(
                    nome: BD.listaUsuario[3].dadosCard.nome,
                    entrada: BD.listaUsuario[3].dadosCard.entrada,
                    situacao: BD.listaUsuario[3].dadosCard.situacao,
                    imagem: BD.listaUsuario[3].dadosCard.imagem,
                    cpf: BD.listaUsuario[3].dadosCard.cpf,
                senha: null),
              ),
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
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 2),
                                child: Text(
                                  'Nome do Médico:*',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 2),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Campo obrigatório";
                                    }

                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    isDense: true,
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 2),
                                child: Text(
                                  'CPF:*',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 2),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Campo obrigatório";
                                    }

                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    isDense: true,
                                    border: InputBorder.none,
                                    filled: true,
                                    fillColor: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 4, vertical: 2),
                                      child: Text('Data do Plantão:*',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold))),
                                  const SizedBox(height: 30),
                                  Expanded(
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Campo obrigatório";
                                        }

                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        hintText: '**/**/****',
                                        hintStyle: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        border: InputBorder.none,
                                        isDense: true,
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                                // Children
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 4, vertical: 2),
                                      child: Text('Horário Plantão:*',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold))),
                                  const SizedBox(height: 30),
                                  Expanded(
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Campo obrigatório";
                                        }

                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        hintText: '**:**h',
                                        hintStyle: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        isDense: true,
                                        border: InputBorder.none,
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                    ),
                                  )
                                ], // Children
                              ),
                              SizedBox(height: 20),
                              SizedBox(height: 50),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      //centralizando os filhos
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              saved = true;
                                              Navigator.pop(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) {
                                                    return const CadastrarPlantao();
                                                  },
                                                ),
                                              );
                                            }
                                          },
                                          child: const Text(
                                            'Salvar',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.black,
                                            ),
                                          ),
                                          style: TextButton.styleFrom(
                                              shape: StadiumBorder(),
                                              backgroundColor:
                                              Color(0xFFFb0bec5),
                                              side: BorderSide(
                                                  width: 3.0,
                                                  color: Color(0xFFF90a4ae))),
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
                ],
              ),
            )),
      ),
    );
  }
}
