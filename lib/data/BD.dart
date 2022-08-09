import 'package:progmobile/widget/dados_usuario_card.dart';
import '../domain/dados_usuario.dart';

class BD {
  static List<DadosUsuarioCard> listaUsuario = [
    const DadosUsuarioCard(
      dadosCard: Usuario(nome: 'Bianca Laiany Bastos Rulim Nunes',
          cpf: '369.951.753-89',
          entrada: '01/07/2022',
          situacao: 'ativo',
          imagem: 'images/bianca_photo.jpg'),
    ),

    const DadosUsuarioCard(
      dadosCard: Usuario(nome: 'Emylle Victoria Costa Cavalcante',
          cpf: '000.000.000-00',
          entrada: '26/07/2022',
          situacao: 'ativo',
          imagem: 'assets/images/emylle_photo.jpg'),


    ),
    const DadosUsuarioCard(
      dadosCard: Usuario(nome: 'Josenilton Ferreira Júnior',
          cpf: '222.333.666-89',
          entrada: '05/07/2022',
          situacao: 'ativo',
          imagem: 'assets/images/josenilton_photo.jpg'),


    ),
    const DadosUsuarioCard(
      dadosCard: Usuario(nome: 'Thayná Ingrid de Paula',
          cpf: '555.888.999-47',
          entrada: '11/03/2022',
          situacao: 'ativo',
          imagem: 'assets/images/thayna_photo.jpg'),


    ),

  ];
}
