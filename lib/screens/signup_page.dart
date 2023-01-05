import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progmobile/domain/dados_usuario.dart';

import '../data/banco_dao.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

final TextEditingController _cpfcontroller = TextEditingController();
final TextEditingController _nomecontroller = TextEditingController();
final TextEditingController _passwordcontroller = TextEditingController();
final TextEditingController _secondpasswordcontroller = TextEditingController();
final _formkey = GlobalKey<FormState>();

class _SignUpPageState extends State<SignUpPage> {

  String? _validarEmail(String? value) {
    // String pattern = r'^(([^<>()[\]\\.,;:\s\"]+(\.[^<>()[\]\\,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    // RegExp regExp = new RegExp(pattern);
    if (value?.length == 0) {
      return "Informe o Email";
      // } else if(!regExp.hasMatch(value!)){
      return "Email inválido";
    }else {
      return null;
    }
  }

  String? _validarSenha(String? value) {
    // String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@(|((+\.)+[a-zA-Z]{2,}))$';
    // RegExp regExp = new RegExp(pattern);
    if (value?.length == 0) {
      return "Informe a Senha";
      //  } else if(!regExp.hasMatch(value!)){
      return "Senha inválida";
    }else {
      return null;
    }
  }

  String? _confirmarSenha(String? value) {
    // String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@(|((+\.)+[a-zA-Z]{2,}))$';
    // RegExp regExp = new RegExp(pattern);
    TextEditingController fulano = _passwordcontroller;
    if (value?.toString() == fulano?.text) {

      return null;
      //  } else if(!regExp.hasMatch(value!)){
      return "Senha inválida";
    }else {
      return "Senhas diferentes!";
    }
  }

  Future<void> onPressed() async {
    if (_formkey.currentState!.validate()) {
      String cpf = _cpfcontroller.text;
      String pwd = _passwordcontroller.text;
      String nm = _nomecontroller.text;
      bool resultado = await Dao().superautenticar(cpf: cpf);

      if (resultado) {
        final msg = SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            ("essa email ja está cadastrado no app!"),
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(msg);

      } else {
        Usuario usuario = Usuario(cpf: cpf, senha: pwd, imagem: '', nome: '', situacao: '', entrada: '');
        await Dao().salvarUser(usuario: usuario);

        showSnackBar('Usuário foi salvo com sucesso!');
        Navigator.pop(context);
      }
    } else {
      print("Formulário invalido");
    }
  }

  onPressedVoltar(){
    Navigator.pop(context);
  }

  showSnackBar(String msg) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(
        vertical: 80,
        horizontal: 32,
      ),
      content: Text(msg),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xFFb9f6ca),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 24),
              Text("Insira CPF e senha", style: TextStyle(fontSize: 35)),
              SizedBox(height: 24),
              Form(key: _formkey,
                  child: Column(
                    children: [
                      SizedBox(height: 24),
                      TextFormField(controller: _cpfcontroller,
                          decoration: InputDecoration(hintText: 'CPF'),
                          validator: _validarEmail
                      ),
                      SizedBox(height: 24),
                      TextFormField(controller: _passwordcontroller,
                        obscureText: true,
                        decoration: InputDecoration(hintText: 'Senha'),
                        validator: _validarSenha,),
                      SizedBox(height: 24),
                      TextFormField(controller: _secondpasswordcontroller,
                        obscureText: true,
                        decoration: InputDecoration(hintText: 'Confirmar senha'),
                        validator: _confirmarSenha,),
                      SizedBox(height: 24),
                      ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.grey[800]),onPressed: onPressed, child: Text("Finalizar Cadastro")),
                      SizedBox(height: 24),
                      ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.grey[800]),onPressed: onPressedVoltar, child: Text("Voltar")),

                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}