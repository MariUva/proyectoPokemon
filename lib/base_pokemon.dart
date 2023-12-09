class BasePokemon  {
  late String _nombre;
  late int _nivel;
  late String _tipo;

  String get nombre => _nombre;
  set nombre(String value) => _nombre = value;

  int get nivel => _nivel;
  set nivel(int value) => _nivel = value;

  String get tipo => _tipo;
  set tipo(String value) => _tipo = value;

  // Constructor
  BasePokemon(this._nombre, this._nivel, this._tipo);
}

