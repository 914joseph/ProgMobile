import 'dart:async';


import 'package:progmobile/screens/home_page.dart';
import 'package:progmobile/screens/signup_page.dart';


import '../data/banco_dao.dart';

import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}
late bool isloading = false;
class _LoginState extends State<Login> {

  TextEditingController _cpfController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  Dao dao = Dao();


  Future<bool?> showDialogLogin() {
    Future.delayed(const Duration(seconds: 5));
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('SEJA BEM-VINDO!'),
            backgroundColor: Colors.white,
            content: Text('Seu login foi efetuado com sucesso...'),
            actions: [
              Icon(
                Icons.account_tree,
                color: Colors.black,
                size: 24.0,
              ),
            ],
          );
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
                radius: 32,
                backgroundImage: AssetImage("assets/images/logoo.png"),)
          )],
    ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: Form(
            key: _formkey,
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
                    } /*else if (value!.length != 9) {
                      return "o cpf digitado precisa ter 9 caracteres!";
                    }*/

                    return null;
                  },
                  controller: _cpfController,
                  decoration:  InputDecoration(
                    enabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                    isDense: true,
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Cpf',
                    border: OutlineInputBorder(
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
                  controller: _passwordController,
                  decoration:  InputDecoration(
                    enabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                    isDense: true,
                    filled: true, //<-- SEE HERE
                    fillColor: Colors.white,
                    labelText: 'Senha',
                    border: OutlineInputBorder(
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
                    child: isloading ? SizedBox(height: 24,child: CircularProgressIndicator()) : Text('Entrar', style: TextStyle(fontSize: 16,color: Colors.white)),
                  ),
                ),
                SizedBox(height: 32),
                ElevatedButton(
                  onPressed: onPressedRegister,
                  style: ElevatedButton.styleFrom(
                    primary:  Color(0xff000000),
                    shape: StadiumBorder(),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: isloading ? SizedBox(height: 24,child: CircularProgressIndicator()) : Text('Cadastrar-se', style: TextStyle(fontSize: 16,color: Colors.white)),
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
 print(_cpfController.text.length);
    if (_formkey.currentState!.validate()) {
      String cpf = _cpfController.text;
      String pwd = _passwordController.text;
      bool resultado = await Dao().autenticar(cpf: cpf, senha: pwd);
      print(resultado);

      if (resultado) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));
      } else {
        final msg = SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            ("Usuario/Senha incorretos"),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(msg);
      }
    } else {
      print("Formulário invalido");
    }
  }

  void onPressedRegister() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const SignUpPage();
        },
      ),
    );

    /*setState(() {
      isloading = true;
    });

    String cpfDigitado = cpfController.text;
    String passwordDigitado = passwordController.text;
     List<Usuario> listausuario = await dao.listarUsuarios();
    print(listausuario[0].cpf);
    print(listausuario[0].senha);
    if (_formKey.currentState!.validate()) {

      listausuario.forEach((element) {
        if(element.cpf == cpfDigitado && element.senha == passwordDigitado){
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
          setState(() {
            isloading= false;
          });
          final snackbar = const SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text(
              'Usuario/Senha incorreto(s)!',
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        }
      });
    } else{
      setState(() {
        isloading= false;
      });
    }*/

  }
}