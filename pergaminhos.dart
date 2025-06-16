
import 'main.dart';

class Pergaminhos extends Item{
  String autor;
  Pergaminhos(
    String nome, 
    String categoria, 
    String raridade, 
    String descricao, 
    this.autor
    ) : super(nome, categoria, raridade, descricao);
@override
void mostrar(){
  super.mostrar();
  print('Autor: $autor\n');
}
}
