

class Tenis {
  final String id;
  final String modelo;
  final String marca;
  final int tamanho;
  final String preco;
  

  Tenis(
      {required this.id,
      required this.modelo,
      required this.marca,
      required this.tamanho,
      required this.preco,
      });

  factory Tenis.fromJson(Map<String, dynamic> json) {
    return Tenis(
      id: (json['id'] as int).toString(),
      modelo: json['modelo'] as String,
      marca: json['marca'] as String,
      tamanho: json['tamanho'] as int,
      preco: json['preco'] as String,
      
    );
  }

  @override
  String toString() {
    return 'Trans{id: $id, modelo: $modelo, tamanho: $tamanho}';
  }
}
