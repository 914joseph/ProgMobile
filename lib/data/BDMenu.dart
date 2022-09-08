import 'package:progmobile/domain/opcoes_menu.dart';
import 'package:progmobile/widget/opcoes_menu_card.dart';
import '../widget/opcoes_menu_card.dart';

class BDMenu {
  static List<DadosMenuCard> opcoesMenu = [
    const DadosMenuCard(
      opcoesMenu: OpcoesMenu(
        opcao: "Cadastrar Plantão",
        icon: "https://cdn-icons-png.flaticon.com/512/4185/4185164.png",
        boolfuncao: true,
        index: 0,
      ),
    ),
    const DadosMenuCard(
      opcoesMenu: OpcoesMenu(
        opcao: "Cadastrar Médico",
        icon: "https://cdn-icons-png.flaticon.com/512/4185/4185164.png",
        boolfuncao: false,
        index: 1,
      ),
    ),
    const DadosMenuCard(
      opcoesMenu: OpcoesMenu(
        opcao: "Listagem de Médicos/Plantões",
        icon: "https://cdn-icons-png.flaticon.com/512/4185/4185164.png",
        boolfuncao: true,
        index: 2,
      ),
    ),
  ];
}
