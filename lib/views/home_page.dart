import 'package:flutter/material.dart';
import 'calculator_page.dart'; // archivo de la calculadora
import 'pokemon_page.dart';    //archivo de los Pokémon

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menú Principal'),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.0,
          children: [
            // Tarjeta 1: La Calculadora
            _buildMenuCard(
              context,
              icon: Icons.calculate,
              title: 'Calculadora',
              subtitle: 'Operaciones matemáticas',
              color: Colors.blue,
              onTap: () {
                // Al hacer clic, viajamos a la pantalla de la Calculadora
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CalculatorPage(),
                  ),
                );
              },
            ),
            // Tarjeta 2: La Pokédex
            _buildMenuCard(
              context,
              icon: Icons.pets, // O usa Icons.catching_pokemon si tu Flutter lo tiene
              title: 'Pokédex',
              subtitle: 'Lista de Pokémon (API)',
              color: Colors.red,
              onTap: () {
                // Al hacer clic, viajamos a la pantalla de los Pokémon
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PokemonPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Construye una tarjeta de menú (Igual a tu proyecto anterior)
  Widget _buildMenuCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 64, color: color),
              const SizedBox(height: 12),
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}