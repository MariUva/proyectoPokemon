import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pokemon/pokemon.dart';

class DetallesPokemon extends StatelessWidget {
  final Pokemon pokemon;

  DetallesPokemon({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.nombre),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageWidget(pokemon.foto), // Utiliza la función _buildImageWidget
            SizedBox(height: 16),
            Text('Descripción: ${pokemon.descripcion}'),
            Text('Habilidad: ${pokemon.habilidad}'),
            Text('Daño de Habilidad: ${pokemon.danoHabilidad}'),
            Text('Edad: ${pokemon.edad}'),
            Text('Fecha de Registro: ${pokemon.fechaRegistro}'),
            Text('Tipo: ${pokemon.tipo}'),
            Text('Nivel: ${pokemon.nivel}'),
          ],
        ),
      ),
    );
  }

  Widget _buildImageWidget(String foto) {
    if (foto.startsWith('http') || foto.startsWith('https')) {
      // Si la ruta de la imagen comienza con 'http' o 'https', es una URL de red
      return Image.network(
        foto,
        width: 200,
        height: 200,
        errorBuilder: (context, error, stackTrace) {
          return Placeholder();
        },
      );
    } else {
      // Si no, asumimos que es una ruta de archivo local
      return Image.file(
        File(foto),
        height: 200,
        width: 200,
      );
    }
  }
}
