import 'package:flutter/material.dart';
import '../models/pokemon_model.dart';
import '../services/pokemon_service.dart'; 

class PokemonPage extends StatefulWidget {
  const PokemonPage({super.key});

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  final PokemonService _pokemonService = PokemonService();
  late Future<List<Pokemon>> _futurePokemons;

  @override
  void initState() {
    super.initState();
    // Cuando la pantalla se abre, inmediatamente pedimos los Pokémon
    _futurePokemons = _pokemonService.getPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
        backgroundColor: Colors.redAccent, 
      ),
      // FutureBuilder es un widget que sabe esperar a internet
      body: FutureBuilder<List<Pokemon>>(
        future: _futurePokemons,
        builder: (context, snapshot) {
          // 1. Si está cargando, mostramos una ruedita
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } 
          // 2. Si hubo un error, lo mostramos
          else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } 
          // 3. Si todo salió bien, dibujamos la lista
          else if (snapshot.hasData) {
            final pokemons = snapshot.data!;
            return ListView.builder(
              itemCount: pokemons.length,
              itemBuilder: (context, index) {
                final poke = pokemons[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    // Aquí usamos Image.network para descargar la imagen
                    leading: Image.network(poke.imageUrl, width: 60, height: 60),
                    title: Text(poke.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                );
              },
            );
          }
          // Por defecto
          return const Center(child: Text('No se encontraron Pokémon.'));
        },
      ),
    );
  }
}