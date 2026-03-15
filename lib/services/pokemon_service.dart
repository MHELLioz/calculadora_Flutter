import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pokemon_model.dart'; 

class PokemonService {
  // Vamos a pedir los primeros 20 Pokémon para no usar tantos datos
  static const String _url = 'https://pokeapi.co/api/v2/pokemon?limit=20';

  Future<List<Pokemon>> getPokemons() async {
    try {
      final response = await http.get(Uri.parse(_url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> pokemonList = data['results'];
        
        // Convertimos la lista de internet a nuestra lista de Dart
        return pokemonList.map((json) => Pokemon.fromJson(json)).toList();
      } else {
        throw Exception('Error al cargar la API: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error de conexión: $e');
    }
  }
}