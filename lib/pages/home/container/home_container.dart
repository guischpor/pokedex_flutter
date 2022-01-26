import 'package:flutter/material.dart';
import 'package:pokedex_flutter/core/models/pokemon_model.dart';
import 'package:pokedex_flutter/core/repositories/pokemon_repository.dart';
import 'package:pokedex_flutter/pages/home/home_error.dart';
import 'package:pokedex_flutter/pages/home/home_loading.dart';
import 'package:pokedex_flutter/pages/home/home_page.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({Key? key, required this.repository}) : super(key: key);
  final IPokemonRepository repository;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      future: repository.getAllPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const HomeLoading();
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomePage(pokemon: snapshot.data!);
        }

        if (snapshot.hasError) {
          return HomeError(
            error: snapshot.error.toString(),
          );
        }

        return Container();
      },
    );
  }
}
