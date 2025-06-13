import 'dart:io';
void mostrarItens (String categoria, List<String> listaselecionada) {
  print('mostrar itens da categoria $categoria: $listaselecionada');
} 

bool itemExiste(List<String> listaselecionada, String? nome){
  return listaselecionada.any((item) => item.toLowerCase() == nome?.toLowerCase());
}
void adicionarItem(List<String> listaselecionada, String? novoitem){
  if(itemExiste(listaselecionada, novoitem)){
    print('este item já existe!');
  } else {
    listaselecionada.add(novoitem!);
    print('item adicionado com sucesso!');
  }
}

void main(){
List<String> livros = ['poções mágicas','feitiços fabulosos','coletaneas de bruxas'];
List<String> artefatos = ['vassoura','varinha mágica','caldeirão'];
List<String> pocoesantigas =['amor','dinheiro','felicidade','atração'];
List<String> itenscomuns = ["relógio antigo","mapa do tesouro","lâmpada mística"];
bool continuar =true;
List<String>? listaselecionada;
  String nomeCategoria = "";

while (continuar){
print('bem vindo a loja!!');
print('qual categoria deseja acessar? (livros/artefatos/poçõesantigas/itenscomuns?)');
String? categoria = stdin.readLineSync();
  if(categoria?.toLowerCase() == 'livros'){
    listaselecionada = livros;
    nomeCategoria = 'livros';
  }else if (categoria?.toLowerCase() == 'artefatos'){
    listaselecionada = artefatos;
    nomeCategoria = 'artefatos';
  } else if (categoria?.toLowerCase() == 'pocoesantigas'){
   listaselecionada = pocoesantigas;
   nomeCategoria = 'pocoesantigas';
  } else if (categoria?.toLowerCase() == 'itenscomuns'){
    listaselecionada = itenscomuns;
    nomeCategoria = 'itenscomuns';
  } else {
    print('categoria inválida');
    continue;
  }
  mostrarItens(nomeCategoria, listaselecionada);
  print('deseja buscar um item? (s/n)');
  String? buscar = stdin.readLineSync();
  if (buscar =='s'){
    print('digite o nome do item:');
    String? nome = stdin.readLineSync();
    if (itemExiste(listaselecionada, nome)){
      print('item encontrado!');
    }
    print('item não encontrado');
  }
  print('deseja adiconar algum item?(s/n)');
  String? adicionar = stdin.readLineSync();
  if(adicionar =='s'){
    print('digite o nome do novo item');
    String?novo = stdin.readLineSync();
    adicionarItem(listaselecionada, novo);
  } 
  print('deseja sair? (s/n)');
  String? sair = stdin.readLineSync();
  if (sair?.toLowerCase() == 's'){
    continuar = false;
    print('obrigado por vir a loja, volte sempre!');
  }
}

}