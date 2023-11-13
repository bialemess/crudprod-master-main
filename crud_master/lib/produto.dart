// ignore_for_file: prefer_final_fields

class Produto {
  String nome;
  int codigo;

  int quantidade;
  int preco;


  Produto({ required this.nome, required this.codigo, required this.quantidade, required this.preco });

  Produto.produtogeral({      
    required this.nome,
    required this.codigo,
    required this.quantidade,
    required this.preco,
  });

  Produto.produtoupdate({
    required this.nome,
    required this.codigo,
    required this.quantidade,
    required this.preco,
  });
}
