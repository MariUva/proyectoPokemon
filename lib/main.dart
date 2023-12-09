import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pokemon/pokemon.dart';
import 'package:pokemon/screens/lista_pokemon.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
   List<Pokemon> listaPokemones = [
    
  Pokemon(
    nombre: 'Charmander',
    descripcion: 'Un Pokémon de fuego pequeño y carismático.',
    habilidad: 'Llamarada',
    danoHabilidad: 50,
    edad: '15 meses',
    fechaRegistro: DateTime.now(),
    foto: 'https://www.pokemongodex.cz/images/50proc/004-charmander.png',
    tipo: 'Fuego',
    nivel: '5',
  ),
  Pokemon(
    nombre: 'Bulbasaur',
    descripcion: 'Un Pokémon de tipo planta con una planta en su espalda.',
    habilidad: 'Rayo Solar',
    danoHabilidad: 45,
    edad: '3 años',
    fechaRegistro: DateTime.now(),
    foto: 'http://pm1.narvii.com/7051/7f9cb11393d2bcfef79d5566b276e664bdc4b78br1-800-800v2_uhq.jpg',
    tipo: 'Planta',
    nivel: '5',
  ),

  Pokemon(
    nombre: 'Pikachu',
    descripcion: 'Un Pokémon eléctrico con mejillas rojas y cola en forma de rayo.',
    habilidad: 'Impactrueno',
    danoHabilidad: 40,
    edad: '24 meses',
    fechaRegistro: DateTime.now(),
    foto: 'https://assets.pokemon.com/assets/cms2/img/pokedex/full/025.png',
    tipo: 'Eléctrico',
    nivel: '10',
),


];


    return MaterialApp(
      title: 'Pokémon App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PokemonForm(listaPokemones: listaPokemones),
    );
  }
}

class PokemonForm extends StatefulWidget {
  final List<Pokemon> listaPokemones;

  PokemonForm({Key? key, required this.listaPokemones}) : super(key: key);

  @override
  _PokemonFormState createState() => _PokemonFormState();
}

class _PokemonFormState extends State<PokemonForm> {
  final _listaPokemonKey = GlobalKey<ListaPokemonState>();
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _habilidadController = TextEditingController();
  final _danoHabilidadController = TextEditingController();
  final _edadController = TextEditingController();
  String _foto = "";
  final _tipoController = TextEditingController();
  final _nivelController = TextEditingController();


Future<void> _takePhoto() async {
  _getImage(ImageSource.camera);
}

Future<void> _pickImage() async {
  _getImage(ImageSource.gallery);
}

Future<void> _getImage(ImageSource source) async {
  final pickedFile = await _getImageFromSource(source);

  if (pickedFile != null) {
    setState(() {
      _foto = pickedFile.path;
    });
  }
}

Future<XFile?> _getImageFromSource(ImageSource source) async {
  final picker = ImagePicker();
  try {
    final pickedFile = await picker.pickImage(source: source);
    return pickedFile;
  } catch (e) {
    print('Error al obtener la imagen: $e');
    return null;
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar Pokémon'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nombreController,
                decoration: InputDecoration(labelText: 'Nombre'),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.length < 5 ||
                      value.length > 20) {
                    return 'Ingrese un nombre válido (entre 5 y 20 caracteres)';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descripcionController,
                decoration: InputDecoration(labelText: 'Descripción'),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.length < 25 ||
                      value.length > 150) {
                    return 'Ingrese una descripción válida (entre 25 y 150 caracteres)';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _habilidadController,
                decoration: InputDecoration(labelText: 'Habilidad'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese una habilidad válida';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _danoHabilidadController,
                decoration: InputDecoration(labelText: 'Daño de Habilidad'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese un valor numérico';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _edadController,
                decoration: InputDecoration(labelText: 'Edad'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese una edad válida';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: _takePhoto,
                child: Text('Tomar Foto'),
              ),
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Seleccionar Foto'),
              ),
              TextFormField(
                controller: _tipoController,
                decoration: InputDecoration(labelText: 'Tipo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese un tipo válido';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _nivelController,
                decoration: InputDecoration(labelText: 'Nivel'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese un nivel válido';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Crear instancia de Pokemon con los datos del formulario
                    Pokemon nuevoPokemon = Pokemon(
                      nombre: _nombreController.text,
                      descripcion: _descripcionController.text,
                      habilidad: _habilidadController.text,
                      danoHabilidad: int.parse(_danoHabilidadController.text),
                      edad: _edadController.text,
                      fechaRegistro: DateTime.now(),
                      foto: _foto,
                      tipo: _tipoController.text,
                      nivel: _nivelController.text,
                    );

                    widget.listaPokemones.add(nuevoPokemon);

                    // Actualizamos la lista llamando al método updateList
                    _listaPokemonKey.currentState?.updateList();
                    // Force rebuild of the list
                    //<setState(() {});

                    // Limpiar los controladores después de registrar un Pokémon
                    _nombreController.clear();
                    _descripcionController.clear();
                    _habilidadController.clear();
                    _danoHabilidadController.clear();
                    _edadController.clear();
                    _tipoController.clear();
                    _nivelController.clear();

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Nuevo Pokémon registrado: ${nuevoPokemon.nombre}'),
                      ),
                    );
                  }
                },
                child: Text('Registrar Pokémon'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => ListaPokemon(key: _listaPokemonKey, listaPokemones: widget.listaPokemones),
                    ),
                  );
                },
                child: Text('Ver Lista de Pokemones'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
