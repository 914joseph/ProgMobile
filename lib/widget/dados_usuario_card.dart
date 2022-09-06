import 'package:flutter/material.dart';
import '../widget/dados_usuario_card.dart';
import '../domain/dados_usuario.dart';

class DadosUsuarioCard extends StatefulWidget {
  final Usuario dadosCard;

  const DadosUsuarioCard({Key? key, required this.dadosCard}) : super(key: key);

  @override
  _DadosUsuarioCardState createState() => _DadosUsuarioCardState();
}

class _DadosUsuarioCardState extends State<DadosUsuarioCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 80,
        width: double.maxFinite,
        decoration: BoxDecoration(
          border: Border.all(width: 4),
          color: const Color(0xFFA6A6A6),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            /*Expanded(*/
            /*flex: 1,*/
            /*child: */ Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(14, 0, 0, 0),
              child: Center(
                child: Container(
                  child: buildImage(),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    color: const Color(0xFFA6A6A6),
                  ),
                ),
              ),
            ),
            /*),*/
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Nome:  ${widget.dadosCard.nome}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 12.0),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'CPF:  ${widget.dadosCard.cpf}',
                            style: const TextStyle(fontSize: 12.0),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Entrada:  ${widget.dadosCard.entrada}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 12.0),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Situação:  ${widget.dadosCard.situacao}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 12.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Image buildImage() {
    String imagem =
        widget.dadosCard.imagem == "" ? "assets/images/bianca_photo.jpg" : widget.dadosCard.imagem;

    return Image.asset(imagem);
  }
}
