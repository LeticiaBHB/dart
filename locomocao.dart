
class Locomocao {
  String vassoura;
  String material;
  String velocidade;

Locomocao (this.vassoura, this.material, this.velocidade);

void revelar(){
  print('🧹 Vassoura: $vassoura');
  print('material: $material');
  print('velocidade: $velocidade');
}

Map<String,dynamic> toMap(){
  return{
    'vassoura': vassoura,
    'material': material,
    'velocidade': velocidade,
  };
}

factory Locomocao.fromMap(Map<String, dynamic> map){
  return Locomocao(
    map['vassoura'],
    map['material'],
    map['velocidade'],
  );
}
}