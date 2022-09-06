class DadosMedico {
  //classe DadosMedico que contem os atributos dos mesmos
  String nome;
  String endereco;
  String cpf;
  String crm;
  String telefone;
  String especializacao;

  DadosMedico({
    //construtor
    required this.nome, //obrigatoriedade dos parâmetros
    required this.endereco,
    required this.cpf,
    required this.crm,
    required this.telefone,
    required this.especializacao,
  });
}
