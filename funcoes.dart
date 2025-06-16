
void mostrarItens(String categoria, List<String> listaselecionada) {
  print('mostrar itens da categoria $categoria: $listaselecionada');
}

bool itemExiste(List<String> listaselecionada, String? nome) {
  return listaselecionada.any(
    (item) => item.toLowerCase() == nome?.toLowerCase(),
  );
}

void adicionarItem(List<String> listaselecionada, String? novoitem) {
  if (itemExiste(listaselecionada, novoitem)) {
    print('este item já existe!');
  } else {
    listaselecionada.add(novoitem!);
    print('item adicionado com sucesso!');
  }
}

void filtrarporLetra(List<String> lista, String letra) {
  var filtrados = lista
      .where((item) => item.toLowerCase().startsWith(letra.toLowerCase()))
      .toList();
  print('itens que começam com "$letra":$filtrados');
}

void removerItem(List<String> lista, String? nome) {
  if (nome == null || nome.isEmpty) {
    print('nome inválido');
    return;
  }
  int antes = lista.length;
  lista.removeWhere((item) => item.toLowerCase() == nome.toLowerCase());
  if (lista.length < antes) {
    print('item removido com sucesso!');
  } else {
    print('item não encontrado para a remoção');
  }
}

void quantidadeitens(List<String> lista, String nomeCategoria) {
  print('A categoria "$nomeCategoria" tem ${lista.length} item(ns).');
}
