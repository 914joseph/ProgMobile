import 'package:progmobile/domain/dados_medico.dart';
import 'package:flutter/material.dart';

class DadosMedicoCard extends StatefulWidget {
  final DadosMedico dadosMedico;
  //criação de um objeto do tipo DadosMedico que contem os dados do mesmo

  const DadosMedicoCard({
    Key? key,
    required this.dadosMedico,
  }) : super(key: key);

  @override
  _DadosMedicoCardState createState() => _DadosMedicoCardState();
}

class _DadosMedicoCardState extends State<DadosMedicoCard> {
  DadosMedico get medico => widget.dadosMedico; //???

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nome: ",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(medico.nome),
                const SizedBox(height: 8),
                Text(
                  "Endereço: ",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(medico.endereco),
                const SizedBox(height: 8),
                Text(
                  "CPF: ",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(medico.cpf),
                const SizedBox(height: 8),
                Text(
                  "CRM: ",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(medico.crm),
                const SizedBox(height: 8),
                Text(
                  "Telefone: ",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(medico.telefone),
                const SizedBox(height: 8),
                Text(
                  "Especialização: ",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(medico.especializacao),
              ],
            ),
          )
        ],
      ),
    );
  }
}
