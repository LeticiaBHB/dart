class Item {
  String nome;
  String categoria;
  String raridade;
  String descricao;

  Item(this.nome, this.categoria, this.raridade, this.descricao);

  void mostrar() {
    print('🔸 $nome');
    print('   Categoria: $categoria');
    print('   Raridade: $raridade');
    print('   Descrição: $descricao\n');
  }
}
