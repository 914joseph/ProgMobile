import 'package:progmobile/widget/dados_medico_card.dart';
import 'package:progmobile/domain/dados_medico.dart';
import 'package:progmobile/data/BDMedicos.dart';
import 'package:flutter/material.dart';

class GridViewPage extends StatefulWidget {
  const GridViewPage({Key? key}) : super(key: key);

  @override
  State<GridViewPage> createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  List<DadosMedico> lista = BD.listaMedicos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[200],
      body:
          Padding(
              padding: const EdgeInsets.all(16.0), child: buildListView(context)),
    )
    //Padding(
        ;
  }

// constrói os filhos sob demanda.
// exibições de lista com um número grande de filhos porque
// o construtor é chamado apenas para os filhos que são realmente visíveis.
// evita repetição de código
  buildListView(BuildContext context) {
    //construtor do listview
    return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //cria um layout com um número fixo de colunas
              crossAxisCount: 2, //quantidade de colunas por linha
              childAspectRatio: 0.45), //tamanho de cada coluna
          itemCount: lista.length,
          itemBuilder: (context, index) {
            return DadosMedicoCard(
              dadosMedico: lista[index],
            );
          },
        )
      ;
  }
}
