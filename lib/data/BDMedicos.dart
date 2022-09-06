import 'package:progmobile/domain/dados_medico.dart';

//criação da classe banco de dados para simular os dados dos médicos

class BD {
  static List<DadosMedico> listaMedicos = [
    //lista do tipo DadosMedico que recebe objetos
    //do tipo DadosMedico com os respectivos atributos
    DadosMedico(
      nome: 'Tarsis Marinho de Souza',
      endereco: 'Rua 15 de Agosto - 181',
      cpf: '143.524.691-00',
      crm: 'CRM/AL 123456',
      telefone: '(82) 99999-9999',
      especializacao: 'Dermatologia',
    ),
    DadosMedico(
      nome: 'Bianca Laiany Bastos Rulim Nunes',
      endereco: 'Rua Samaritana - 180',
      cpf: '000.000.000-00',
      crm: 'CRM/AL 333333',
      telefone: '(82) 99999-9998',
      especializacao: 'Psiquiatria',
    ),
    DadosMedico(
      nome: 'Carolina Fernandes Gonçalves Ferro',
      endereco: 'Rua Santa Terezinha - 145',
      cpf: '143.524.000-00',
      crm: 'CRM/AL 654321',
      telefone: '(82) 99999-8999',
      especializacao: 'Pediatria',
    ),
    DadosMedico(
      nome: 'Carolina Fernandes Gonçalves Ferro',
      endereco: 'Rua Santa Terezinha - 145',
      cpf: '143.524.000-00',
      crm: 'CRM/AL 654321',
      telefone: '(82) 99999-8999',
      especializacao: 'Pediatria',
    ),
  ];
}
