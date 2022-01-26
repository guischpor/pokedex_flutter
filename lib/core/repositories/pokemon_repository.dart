import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedex_flutter/core/constants/api_consts.dart';
import 'package:pokedex_flutter/core/exceptions/exception_error.dart';
import 'package:pokedex_flutter/core/models/pokemon_model.dart';

abstract class IPokemonRepository {
  Future<List<PokemonModel>> getAllPokemons();
}

class PokemonRepository implements IPokemonRepository {
  final Dio dio;

  PokemonRepository({required this.dio});

  @override
  Future<List<PokemonModel>> getAllPokemons() async {
    try {
      final response = await dio.get(ApiConsts.allPokemonsURL);
      final json = jsonDecode(response.data) as Map<String, dynamic>;
      final list = json['pokemon'] as List<dynamic>;
      return list.map((e) => PokemonModel.fromMap(e)).toList();
    } catch (e) {
      throw ExceptionsError(message: 'Não foi possivel carregar os dados!');
    }
  }
}
