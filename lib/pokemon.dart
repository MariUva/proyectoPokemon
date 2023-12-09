import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class Pokemon {
  late String nombre;
  late String descripcion;

  late String habilidad;
  late int danoHabilidad;
  late String edad;
  late DateTime fechaRegistro;
  late String foto;
  late String tipo;
  late String nivel;

  Pokemon({
    required this.nombre,
    required this.descripcion,
    
    required this.habilidad,
    required this.danoHabilidad,
    required this.edad,
    required this.fechaRegistro,
    required this.foto,
    required this.tipo,
    required this.nivel,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PokemonForm(),
    );
  }
}

class PokemonForm extends StatefulWidget {
  @override
  _PokemonFormState createState() => _PokemonFormState();
}

class _PokemonFormState extends State<PokemonForm> {
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
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _foto = pickedFile.path;
      });
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _foto = pickedFile.path;
      });
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

                  
                    print('Nuevo Pokémon registrado:');
                    print('Nombre: ${nuevoPokemon.nombre}');
                    print('Descripción: ${nuevoPokemon.descripcion}');
                    print('Habilidad: ${nuevoPokemon.habilidad}');
                    print('Daño de Habilidad: ${nuevoPokemon.danoHabilidad}');
                    print('Edad: ${nuevoPokemon.edad}');
                    print('Fecha de Registro: ${nuevoPokemon.fechaRegistro}');
                    print('Foto: ${nuevoPokemon.foto}');
                    print('tipo: ${nuevoPokemon.tipo}');
                    print('tipo: ${nuevoPokemon.nivel}');

                  }
                },
                child: Text('Registrar Pokémon'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
