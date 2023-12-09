// habilidades_pokemon.dart
import 'package:pokemon/pokemon.dart';

class HabilidadPokemon extends Pokemon {
  late String _habilidad;
  late int _dano;

  String get habilidad => _habilidad;
  set habilidad(String value) => _habilidad = value;

  int get dano => _dano;
  set dano(int value) => _dano = value;

  // Constructor
  HabilidadPokemon({
    required String nombre,
    required int nivel,
    required String tipo,
    required String habilidad,
    required int dano,
  })   : _habilidad = habilidad,
        _dano = dano,
        super(
          nombre: nombre,
          descripcion: '',
          habilidad: '',
          danoHabilidad: 0,
          edad: '',
          fechaRegistro: DateTime.now(),
          foto: '',
          tipo: '',
          nivel: '',
        );
}
