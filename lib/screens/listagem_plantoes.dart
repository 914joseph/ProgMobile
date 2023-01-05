import 'package:flutter/material.dart';
import 'package:progmobile/data/BDLogin.dart';

import '../data/banco_dao.dart';
import '../domain/dados_usuario.dart';
import 'login.dart';

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!MUDAR DEPOIS!!!!!!!!!!!!!!!!!!!!!!
class ListagemPlantoes extends StatefulWidget {
  const ListagemPlantoes({Key? key}) : super(key: key);

  @override
  State<ListagemPlantoes> createState() => _ListagemPlantoesState();
  _ListagemPlantoescreateState() => _ListagemPlantoesState();
}

class _ListagemPlantoesState extends State<ListagemPlantoes> {
  // List<DadosMedico> lista = BD.listaMedicos;
  final List<Map> myProducts =
  List.generate(10, (index) => {"id": index, "name": "Product $index"})
      .toList();

  int _selectedIndex = 0;
  Dao dao = Dao();
  int indexx = 0;
  List<String> lista = ['1','m','gsaeg'];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 2) {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                actions: [
                  ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text("Voltar")),
                  ElevatedButton(onPressed: () {}, child: Text("Sair"))
                ],
                content: Text("Deseja Sair?"),
              );
            });
        _selectedIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[200],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: myProducts.length,
          itemBuilder: (BuildContext ctx, indexx) {
            return ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // <-- Radius
                ),
              ),
              child: Text(myProducts[indexx]["name"], style: TextStyle(color: Colors.black),),
            );
          },
        ),
      ),
    );
  }

  Future<void> onPressed() async {
    /*
    List<Usuario> listausuario = await dao.listarUsuarios();
    setState(() {
      indexx = listausuario.length;
    });
    print(indexx);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(myProducts[indexx]["name"]),
            content: Text(listausuario[indexx].nome),
          );
        });

*/
  }
}
