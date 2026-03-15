class Pokemon {
  final String name;
  final String imageUrl;

  Pokemon({required this.name, required this.imageUrl});

  // Esta función convierte el texto(JSON) en nuestro objeto Pokemon
  factory Pokemon.fromJson(Map<String, dynamic> json) {
    final nombre = json['name'];
    final url = json['url'] as String;
    
    
    // Vamos a extraer ese número "1" para conseguir su foto oficial directamente
    final partes = url.split('/');
    final id = partes[partes.length - 2]; 
    final foto = 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';

    return Pokemon(
      name: nombre.toUpperCase(), 
      imageUrl: foto,
    );
  }
}