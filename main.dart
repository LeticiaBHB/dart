import 'dart:io';

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

void main() {
  List<String> livros = [
    'poções mágicas',
    'feitiços fabulosos',
    'coletaneas de bruxas',
  ];
  List<String> artefatos = ['vassoura', 'varinha mágica', 'caldeirão'];
  List<String> itenscomuns = [
    "relógio antigo",
    "mapa do tesouro",
    "lâmpada mística",
  ];

  Item pocoes1 = Item(
    'poções mágicas',
    'Pocões',
    'Usual',
    'poções do dia a dia',
  );
  Item pocoes2 = Item(
    'poções do amor',
    'Pocões',
    'Casual',
    'poções para o amor',
  );
  Item pocoes3 = Item(
    'poções da felicidade',
    'Pocões',
    'Usual',
    'poções do dia a dia',
  );
  Item pocoes4 = Item(
    'poções da fortuna',
    'Pocões',
    'Rara',
    'Contém receitas secretas',
  );
  Item pocoes5 = Item(
    'poções da eternidade',
    'Pocões',
    'Lendária',
    'poções feitas para durar',
  );

  List<Item> inventario = [pocoes1, pocoes2, pocoes3, pocoes4, pocoes5];
  bool continuar = true;
  List<String>? listaselecionada;
  String nomeCategoria = "";

  while (continuar) {
    print('bem vindo a loja!!');
    print(
      'qual categoria deseja acessar? (livros/artefatos/poçõesantigas/itenscomuns?)',
    );
    String? categoria = stdin.readLineSync();
    if (categoria?.toLowerCase() == 'livros') {
      listaselecionada = livros;
      nomeCategoria = 'livros';
    } else if (categoria?.toLowerCase() == 'artefatos') {
      listaselecionada = artefatos;
      nomeCategoria = 'artefatos';
    } else if (categoria?.toLowerCase() == 'itenscomuns') {
      listaselecionada = itenscomuns;
      nomeCategoria = 'itenscomuns';
    } else {
      print('categoria inválida');
      continue;
    }
    mostrarItens(nomeCategoria, listaselecionada);
    print('deseja buscar um item? (s/n)');
    String? buscar = stdin.readLineSync();
    if (buscar == 's') {
      print(
        'O que quer pesquisar: 1. o nome do item ou 2. a letra que começa o item?',
      );
      String? nomeletra = stdin.readLineSync();
      if (nomeletra == '1') {
        print('digite o nome do item:');
        String? nome = stdin.readLineSync();
        if (itemExiste(listaselecionada, nome)) {
          print('item encontrado!');
        }
        print('item não encontrado');
      } else if (nomeletra == '2') {
        print('digite a letra inicial para filtrar:');
        String? letra = stdin.readLineSync();
        if (letra != null && letra.isNotEmpty) {
          filtrarporLetra(listaselecionada, letra);
        } else {
          print('esta letra incial não tem em nenhum dos nossos produtos!');
        }
      }
    }
    print('deseja saber quantos itens tem? s/n');
    String? quantidade = stdin.readLineSync();
    if (quantidade == 's') {
      quantidadeitens(listaselecionada, nomeCategoria);
    }
    print('deseja adiconar algum item?(s/n)');
    String? adicionar = stdin.readLineSync();
    if (adicionar == 's') {
      print('digite o nome do novo item');
      String? novo = stdin.readLineSync();
      adicionarItem(listaselecionada, novo);
    }
    ;
    print('deseja remover algum item? s/n');
    String? remove = stdin.readLineSync();
    if (remove == 's') {
      print('digite o item a ser removido:');
      String? itemParaRemover = stdin.readLineSync();
      removerItem(listaselecionada, itemParaRemover ?? '');
    }
    print('quer ir para o setor de poções?(s/n)');
    String? pocoessim = stdin.readLineSync();
    if (pocoessim?.toLowerCase() == 's') {
      print('bem vindo ao setor mais famoso!!');
      var adquiridos = Item(
        'poção do bem vindo',
        'poções',
        'nenhuma',
        'nivel inicial',
      );
      adquiridos.mostrar();
      inventario.forEach((item) => item.mostrar());
      print('Qual raridade quer escolher: Usual / Casual / Rara / Lendária?');
        String? raridadeselecionada = stdin.readLineSync();
        if (raridadeselecionada != null && raridadeselecionada.isNotEmpty) {
          List<Item> filtrados = inventario
              .where(
                (item) =>
                    item.raridade.toLowerCase() ==
                    raridadeselecionada.toLowerCase(),
              )
              .toList();
          if (filtrados.isNotEmpty) {
            print('\n Itens com raridade "$raridadeselecionada":');
            filtrados.forEach((item) => item.mostrar());
          } else {
            print('nenhum item encontrado com essa raridade');
          }
        } else {
          print('raridade inválida');
          continue;
      }
    }

    print('deseja sair? (s/n)');
    String? sair = stdin.readLineSync();
    if (sair?.toLowerCase() == 's') {
      continuar = false;
      print('obrigado por vir a loja, volte sempre!');
    }
  }
}
