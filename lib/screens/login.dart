import 'dart:async';

import 'package:progmobile/domain/dados_usuario.dart';

import '../data/BDLogin.dart';
import '../data/banco_dao.dart';
import '../screens/login.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}
late bool isloading = false;
class _LoginState extends State<Login> {

  TextEditingController cpfController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Dao dao = Dao();


  Future<bool?> showDialogLogin() {
    Future.delayed(const Duration(seconds: 5));
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('SEJA BEM-VINDO!'),
            backgroundColor: Colors.white,
            //form: RoundedRectangleBorder(borderRadius.all (Radius.circular(20))),
            content: Text('Seu login foi efetuado com sucesso...'),
            actions: [
              Icon(
                Icons.account_tree,
                color: Colors.black,
                size: 24.0,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const HomePage();
                      },
                    ),
                  );
                },
                child: const Text('Ok'),
              ),
            ],
          );
          // Text('Seu login foi efetuado com sucesso...'),
          //     IconButton(
          //       //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          //       icon: Icon(Icons.arrow_back), //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          //       color: Colors.black, //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          //       onPressed: () {}), //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

          //   //chaves do title Text
          // );
        });
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    isloading = false;
  }
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xffc5e1a5),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.lightGreen[200],
        title: Text('SISTEMA GERENCIADOR \n DE PLANTÃO',
            style: const TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage("assets/images/logoo.png"),)
          )],
    ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                 Text(
                  'HOSPITAL DO AMOR - SGP - SISTEMA GERENCIADOR DE PLANTÃO',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                 SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  padding:  EdgeInsets.all(4),
                  child: Column(
                    children: [
                       Text(
                        'ATENÇÃO!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                       Text(
                        'O sistema diferencia letras maiúsculas de minúsculas APENAS na senha, portanto ela deve ser digitada da mesma maneira que no cadastro.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                       Text(
                        'Durante o login não é necessário adicionar o traço ( -) e/ou ponto (.) , ou qual quer outro tipo de sinal.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Campo obrigatório";
                    } else if (value!.length < 9 || value!.length > 9) {
                      return "o cpf digitado precisa ter 9 caracteres!";
                    }

                    return null;
                  },
                  controller: cpfController,
                  decoration:  InputDecoration(
                    enabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                    isDense: true,
                    filled: true, //<-- SEE HERE
                    fillColor: Colors.white,
                    labelText: 'Cpf',
                    border: OutlineInputBorder(
                      // ou UnderlineInputBorder()
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.amberAccent, width: 1),
                    ),
                  ),
                ),
                 SizedBox(height: 16),
                TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Campo obrigatório";
                    }

                    return null;
                  },
                  controller: passwordController,
                  decoration:  InputDecoration(
                    enabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                    isDense: true,
                    filled: true, //<-- SEE HERE
                    fillColor: Colors.white,
                    labelText: 'Senha',
                    border: OutlineInputBorder(
                      // ou UnderlineInputBorder()
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.amberAccent, width: 1),
                    ),
                  ),
                ),
                 SizedBox(height: 32),
                ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    primary:  Color(0xff000000),
                    shape: StadiumBorder(),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: isloading ? CircularProgressIndicator() : Text('Entrar', style: TextStyle(fontSize: 16,color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onPressed() async {
    print(isloading);
    isloading = true;
    print(isloading);
    String cpfDigitado = cpfController.text;
    String passwordDigitado = passwordController.text;

    String user = 'joao@gmail.com';
    String password = '123456';
     List<Usuario> listausuario = await dao.listarUsuarios();

    print(listausuario[0].cpf);
    print(listausuario[0].senha);
    if (_formKey.currentState!.validate()) {
      for (int i = 0; i < listausuario.length; i++) {
        if (cpfDigitado == listausuario[i].cpf &&
            passwordDigitado == listausuario[i].senha) {

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const HomePage();
              },
            ),
          );
          showDialogLogin();
        } else {
          final snackbar = const SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text(
              'Usuario/Senha incorreto(s)!',
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        }
      }

    }
    /*if (_formKey.currentState!.validate()) {
      if (cpfDigitado == user && passwordDigitado == password) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const Login();
            },
          ),
        );
        showDialogLogin();
      } else {
        final snackbar = const SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            'Usuario/Senha incorreto(s)!',
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }
    }*/
  }
}




// actions: <Widget>[
//             CircleAvatar(radius: 32,
//                 backgroundImage: AssetImage("assets/images/logoo.png"),
//           ),
//         ],