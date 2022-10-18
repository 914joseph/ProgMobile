import '../screens/login.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                        return const Login();
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

  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: Form(
          key: _formKey,
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
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                padding: const EdgeInsets.all(4),
                child: Column(
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
                  ],
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Campo obrigatório";
                  }

                  return null;
                },
                controller: userController,
                decoration: const InputDecoration(
                  enabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.all(10),
                  isDense: true,
                  filled: true, //<-- SEE HERE
                  fillColor: Colors.white,
                  labelText: 'Usuario',
                  border: OutlineInputBorder(
                    // ou UnderlineInputBorder()
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    borderSide: BorderSide(color: Colors.amberAccent, width: 1),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Campo obrigatório";
                  } else if (value!.length < 6) {
                    return "A senha precisa ter no minimo 6 digitos";
                  }

                  return null;
                },
                controller: passwordController,
                decoration: const InputDecoration(
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
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  primary: const Color(0xff000000),
                  shape: StadiumBorder(),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    'Entrar',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onPressed() {
    String userDigitado = userController.text;
    String passwordDigitado = passwordController.text;

    String user = 'joao@gmail.com';
    String password = '123456';

    if (_formKey.currentState!.validate()) {
      if (userDigitado == user && passwordDigitado == password) {
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
    }
  }
}




// actions: <Widget>[
//             CircleAvatar(radius: 32,
//                 backgroundImage: AssetImage("assets/images/logoo.png"),
//           ),
//         ],