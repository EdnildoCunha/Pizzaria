//CLASSE DE PRODUTOS - GENÉRICO
class Produto {
  String? tipo;
  Produto({this.tipo});
}

class Refrigerante extends Produto {
  String _nome;
  double _preco;

  Refrigerante(String nome, double preco)
      : this._nome = nome,
        this._preco = preco,
        super(tipo: "Refrigerante");

  String get nome {
    return this._nome;
  }

  double get preco {
    return this._preco;
  }
}

class Pizza extends Produto {
  String _nome;
  double _preco;

  Pizza(String nome, double preco)
      : this._nome = nome,
        this._preco = preco,
        super(tipo: "Pizza");

  String get nome {
    return this._nome;
  }

  double get preco {
    return this._preco;
  }
}

//BANCO DE DADOS
class BancoDados {
  List<dynamic> produtos = [];

  void adicionarProduto(dynamic produto) {
    this.produtos.add(produto);
  }

  void cardapio() {
    print("--- CARDÁPIO ---");
    print("PIZZAS --- R\$ PREÇO\n");
    produtos.forEach((p) {
      if (p.tipo == "Pizza") {
        print("${p.nome} --- R\$ ${p.preco}");
      }
    });
    print("\nBEBIDAS --- R\$ PREÇO");
    produtos.forEach((p) {
      if (p.tipo == "Refrigerante") {
        print("${p.nome} --- R\$ ${p.preco}");
      }
    });
  }
}

//CLASSE PARA ALIMENTAR OS ITENS DO PEDIDO
class Carrinho {
  List<dynamic> produtos = [];

  void adicionarItem(p) {
    this.produtos.add(p);
  }

  double totalCompra() {
    double total = 0;
    produtos.forEach((p) {
      total += p.preco;
    });
    return total;
  }
}

main() {
  //CRIANDO BANCO DE DADOS
  BancoDados bd = BancoDados();

  //ALIMENTANDO BANCO DE DADOS
  final calabresa = Pizza("Calabresa", 20.00);
  bd.adicionarProduto(calabresa);
  final atum = Pizza("Atum", 25.00);
  bd.adicionarProduto(atum);
  final banana = Pizza("Banana com canela", 20.00);
  bd.adicionarProduto(banana);
  final kuat = Refrigerante("Kuat", 7.00);
  bd.adicionarProduto(kuat);
  final bare = Refrigerante("Baré", 9.00);
  bd.adicionarProduto(bare);
  final coca = Refrigerante("Coca-cola", 8.00);
  bd.adicionarProduto(coca);

  //CARDÁPIO
  bd.cardapio();

  //CRIANDO CARRINHO COM PRODUTOS
  var Pedido = Carrinho();
  Pedido.adicionarItem(calabresa);
  Pedido.adicionarItem(atum);
  Pedido.adicionarItem(coca);
  Pedido.adicionarItem(banana);

  //CALCULANDO TOTAL DO PEDIDO
  double total = Pedido.totalCompra();

  //EXIBINDO TOTAL DO PEDIDO
  print("Total: $total");
}
