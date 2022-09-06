import '../screens/login.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.lightGreen[200],
        title: Text('SISTEMA GERENCIADOR \n DE PLANTÃO', style: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
        actions: <Widget>[
            CircleAvatar(radius: 32,
                backgroundImage: AssetImage("assets/images/logoo.png"),
          ),
        ],
      ),
      backgroundColor: Colors.lightGreen[200],
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,

                      children: [
                        const Text(
                          'HOSPITAL DO AMOR - SGP - SISTEMA GERENCIADOR DE PLANTÃO',
                          textAlign: TextAlign.center,
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

            const SizedBox(height: 16), // espaço entre dois coontainer
            Container(
              //container 2
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              padding: const EdgeInsets.all(4),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,

                      children: [
                        const Text(
                          'ATENÇÃO!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'O sistema diferencia letras maiúsculas de minúsculas APENAS na senha, portanto ela deve ser digitada da mesma maneira que no cadastro.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          'Durante o login não é necessário adicionar o traço ( -) e/ou ponto (.) , ou qual quer outro tipo de sinal.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                      ], // Children
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            Container(
              //conteiner 3

              padding: const EdgeInsets.all(4),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,

                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 44, vertical: 2),
                          child: Text(
                            'CPF do Usuário:*',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 44, vertical: 2),
                          child: TextField(
                            decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.all(10),
                              isDense: true,
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 44, vertical: 2),
                          child: Text(
                            'Senha:*',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 44, vertical: 2),
                          child: TextField(
                            decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.all(10),
                              isDense: true,
                              border: OutlineInputBorder(),
                              filled: true, //<-- SEE HERE
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                      ], // Children
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              //conteiner 4
              margin: (EdgeInsets.only(top: 10, left: 80, right: 170)),
              height: 50,
              width: 100,

              child: Row(
                children: [
                  Expanded(
                    //expanded da coluna para não pegar todo o conteúdo ao lado e empurrar pra fora de tela
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch, //cross para aliunhar a coluna

                      children: [
                        ElevatedButton(
                          //configurações do botão padrão/estilo
                          onPressed: () {
                            //o que vai retornar no botão
                            Navigator.pushReplacement(
                              //não ficar no lixo de memória
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return  HomePage();
                                },
                              ),
                            );
                          },
                          child: const Text(
                            'Entrar',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            //estilo do botão (preto e arrendondado)
                            primary: Color(0xFF000000),
                            shape: StadiumBorder(),
                          ),
                        )
                      ], // Children
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  } //Widget build(BuildContext context) {
} // class _Login extends State<Login> {
