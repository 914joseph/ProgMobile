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
  bool isChecked = false;
  bool isChecked1 = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
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
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
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
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
          actions: <Widget>[
            CircleAvatar(radius: 32,
              backgroundImage: AssetImage("assets/images/logoo.png"),
            ),
          ],
        ),
        backgroundColor: Colors.lightGreen[200],
        body: Padding(
            padding: const EdgeInsets.all(8),
            child: ListView(children: [
              DadosUsuarioCard(
                dadosCard: Usuario(
                    nome: BD.listaUsuario[3].dadosCard.nome,
                    entrada: BD.listaUsuario[3].dadosCard.entrada,
                    situacao: BD.listaUsuario[3].dadosCard.situacao,
                    imagem: BD.listaUsuario[3].dadosCard.imagem,
                    cpf: BD.listaUsuario[3].dadosCard.cpf),
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
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            child: TextField(
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
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5, vertical: 2),
                            child: TextField(
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
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: '**/**/****',
                                    hintStyle:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: '**:**h',
                                    hintStyle:
                                        TextStyle(fontWeight: FontWeight.bold),
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
                          Align(
                            alignment: Alignment.center,
                            child: Text('Tempo de Plantão',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                          Row(
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
                                          checkColor: isChecked
                                              ? Colors.black
                                              : Colors.transparent,
                                          fillColor: MaterialStateProperty.all(
                                              Colors.white),
                                          onChanged: (bool? value) {
                                            setState(() {
                                              isChecked = !isChecked;
                                            });
                                          }),
                                    ),
                                    Text('24H',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
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
                                          checkColor: isChecked1
                                              ? Colors.black
                                              : Colors.transparent,
                                          fillColor: MaterialStateProperty.all(
                                              Colors.white),
                                          onChanged: (bool? value) {
                                            setState(() {
                                              isChecked1 = !isChecked1;
                                            });
                                          }),
                                    ),
                                    Text('12H',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
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
                                  //centralizando os filhos
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        saved = true;
                                        //o que vai retornar no botão
                                        Navigator.pop( // Trocar !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
                                          //não ficar no lixo de memória
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return const CadastrarPlantao();
                                            },
                                          ),
                                        );
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
                                          backgroundColor: Color(0xFFFb0bec5),
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
    ),
    ),
    );
  }
}
