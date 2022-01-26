import 'package:pokedex_flutter/core/models/pokemon_model.dart';

abstract class IPokemonRepository {
  Future<List<PokemonModel>> getAllPokemons();
}

class PokemonRepository implements IPokemonRepository {
  
  @override
  Future<List<PokemonModel>> getAllPokemons() async {
    return [];
  }
}
