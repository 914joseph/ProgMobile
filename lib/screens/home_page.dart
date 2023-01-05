import 'package:flutter/material.dart';
import 'package:progmobile/screens/login.dart';
import '../widget/dados_usuario_card.dart';
import '../widget/opcoes_menu_card.dart';
import '../domain/dados_usuario.dart';
import '../domain/opcoes_menu.dart';
import '../data/BD.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {

  onPressed(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Login()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Color(0xFFb9f6ca),
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
      backgroundColor: const Color(0xFFb9f6ca),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
           BD.listaUsuario[2],
            const SizedBox(height: 40),
            DadosMenuCard(
              dadosOpcoesMenu: OpcoesMenu(
                  opcao: "Cadastrar Plantão",
                  icon:
                      "https://cdn-icons-png.flaticon.com/512/4185/4185164.png",
                  boolfuncao: true,
                  index: 1),
            ),
            DadosMenuCard(
              dadosOpcoesMenu: OpcoesMenu(
                  opcao: "Cadastrar Médico",
                  icon:
                      "https://cdn-icons-png.flaticon.com/512/4185/4185164.png",
                  boolfuncao: false,
                  index: 2),
            ),
            DadosMenuCard(
              dadosOpcoesMenu: OpcoesMenu(
                  opcao: "Listagem de Médicos/Plantões",
                  icon:
                  "https://cdn-icons-png.flaticon.com/512/4185/4185164.png",
                  boolfuncao: true,
                  index: 3),
            ),
            DadosMenuCard(
              dadosOpcoesMenu: OpcoesMenu(
                  opcao: "Localização do Hospital",
                  icon:
                  "https://cdn-icons-png.flaticon.com/512/4185/4185164.png",
                  boolfuncao: true,
                  index: 4),
            ),
            ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.grey[800]),onPressed: onPressed, child: Text("Sair"))
          ],
        ),
      ),
    );
  }
}
