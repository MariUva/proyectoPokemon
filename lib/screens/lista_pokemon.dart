import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pokemon/pokemon.dart';
import 'package:pokemon/screens/detalles_pokemon.dart';

class ListaPokemon extends StatefulWidget {
  final List<Pokemon> listaPokemones;

  // Usamos un key para acceder a la instancia de ListaPokemon
  const ListaPokemon({Key? key, required this.listaPokemones}) : super(key: key);

  @override
  ListaPokemonState createState() => ListaPokemonState();
}

class ListaPokemonState extends State<ListaPokemon> {
  // Método para actualizar la lista
  void updateList() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Pokémon'),
      ),
      body: ListView.builder(
        itemCount: widget.listaPokemones.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: _buildAvatar(widget.listaPokemones[index].foto),
            title: Text(widget.listaPokemones[index].nombre),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetallesPokemon(pokemon: widget.listaPokemones[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildAvatar(String foto) {
    if (foto.startsWith('http') || foto.startsWith('https')) {
      // Si la ruta de la imagen comienza con 'http' o 'https', es una URL de red
      return CircleAvatar(
        backgroundImage: NetworkImage(foto),
      );
    } else {
      // Si no, asumimos que es una ruta de archivo local
      return CircleAvatar(
        backgroundImage: FileImage(File(foto)),
      );
    }
  }
}
