import 'dart:io';
import 'dart:convert';
import 'funcoes.dart';
import 'locomocao.dart';
import 'pergaminhos.dart';
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
  Pergaminhos pergaminho1 = Pergaminhos ('Manuscrito das Sombras',
  'Pergaminho',
  'Lendária',
  'Ensinamentos ancestrais ocultos',
  'Mestre Oculto',
  );

  Locomocao v1 = Locomocao('vassoura simples', 'madeira', '50km');
  Locomocao v2 = Locomocao('vassoura real', 'aço inox', '200km');

  List<Item> inventario = [pocoes1, pocoes2, pocoes3, pocoes4, pocoes5];
  List<Item> relicarios = [pergaminho1];
  List<Locomocao> vassouras = [v1,v2];
  bool continuar = true;
  List<String>? listaselecionada;
  String nomeCategoria = "";

  List<Map<String,dynamic>> mapasVassouras = vassouras.map((v) => v.toMap()).toList();
  String jsonVassouras = jsonEncode(mapasVassouras);
  print(jsonVassouras);

  File('vassouras.json').writeAsStringSync(jsonVassouras);
  String conteudo = File('vassouras.json').readAsStringSync();
  List<dynamic> listaLida = jsonDecode(conteudo);
  List<Locomocao> restauradas = listaLida.map((e) => Locomocao.fromMap(e)).toList();

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
    print('quer adicionar algum item na sessão de poções? s/n');
    String? adicionarpocao = stdin.readLineSync();
    if( adicionarpocao == 's'){
      print('qual será o nome da poção?');
      String? nomepocao = stdin.readLineSync();
      print('qual será a categoria que essa poção vai estar?');
      String? categoriapocao = stdin.readLineSync();
      print('qual será a raridade da poção?');
      String? raridadepocao = stdin.readLineSync();
      print('qual írá ser a descrição da poção?');
      String? descricaopocao = stdin.readLineSync();
      print('está é a poção adicionada:$nomepocao, $categoriapocao, $raridadepocao $descricaopocao, deseja salvar? (s/n)');
      String? salvarsim = stdin.readLineSync();
      if(salvarsim == 's'){
        Item novaPocao = Item(nomepocao ?? '', categoriapocao ?? '', raridadepocao ?? '', descricaopocao ?? '');
        inventario.add(novaPocao);
        print('poção adicionada com sucesso!!');
      }
    }
    print('quer ir para os pergaminhos perdidos? (s/n)');
    String? pergaminhosver = stdin.readLineSync();
    if(pergaminhosver?.toLowerCase() == 's'){
      print('estes são os pergaminhos mágicos $Pergaminhos');
    }
    print('quer ver nossa estante de pergaminhos? s/n');
    String? estantepergaminho = stdin.readLineSync();
    if(estantepergaminho?.toLowerCase() == 's'){
      relicarios.forEach((item) => item.mostrar());
    }
    print('já viu nossas vassouras mágicas? s/n');
    String? vassourasmagicas = stdin.readLineSync();
    if(vassourasmagicas?.toLowerCase() == 's'){
      print('estes são os nossas locomotivas $Locomocao');
    }
    print('quer adicionar mais uma locomoção? s/n');
    String? adicionarlocomocao = stdin.readLineSync();
    if(adicionarlocomocao?.toLowerCase() == 's'){
      print('qual é a vassoura?');
      String? nomevassoura = stdin.readLineSync();
      print('qual é o material da vassoura?');
      String? nomematerial = stdin.readLineSync();
      print('qual a velocidade desta vassoura?');
      String? qualvelocidade = stdin.readLineSync();
      print('está é a locomotiva adicionada: $nomevassoura, $nomematerial,$qualvelocidade, deseja salvar? s/n');
      String? salvarlocomotiva = stdin.readLineSync();
      if(salvarlocomotiva == 's'){
        Locomocao novaLocomocao = Locomocao (nomevassoura ?? '', nomematerial ?? '', qualvelocidade ?? '');
        vassouras.add(novaLocomocao);
        print('locomoção adicionada com sucesso!!');
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
