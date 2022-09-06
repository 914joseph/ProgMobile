class DadosPlantoes {
  //classe DadosMedico que contem os atributos dos mesmos
  String nome;
  String cpf;
  String data;
  String horario;
  String especializacao;

  DadosPlantoes({
    //construtor
    required this.nome, //obrigatoriedade dos parâmetros
    required this.cpf,
    required this.data,
    required this.horario,
    required this.especializacao,
  });
}
