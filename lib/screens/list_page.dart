import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progmobile/screens/home_page.dart';

import '../widget/grid_view.dart';
import 'listagem_plantoes.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  int _selectedIndex = 0;
  List<Widget> pages = [
    const GridViewPage(),
    const ListagemPlantoes(),
  ];

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
                  ElevatedButton(
                      onPressed: () => /*SystemNavigator.pop()*/ exit(0),
                      child: Text("Sair"))
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
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
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
        body: pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Médicos"),
            BottomNavigationBarItem(
                icon: Icon(Icons.build_outlined), label: "Plantões"),
            BottomNavigationBarItem(
                icon: Icon(Icons.logout_outlined), label: "Sair"),
          ],
        ));
  }
}
