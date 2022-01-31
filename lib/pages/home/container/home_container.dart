import 'package:flutter/material.dart';
import 'package:pokedex_flutter/core/exceptions/exception_error.dart';
import 'package:pokedex_flutter/core/models/pokemon_model.dart';
import 'package:pokedex_flutter/core/repositories/pokemon_repository.dart';
import 'package:pokedex_flutter/pages/detail/container/detail_container.dart';
import 'package:pokedex_flutter/widgets/po_error.dart';
import 'package:pokedex_flutter/pages/home/home_page.dart';
import 'package:pokedex_flutter/widgets/po_loading.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({
    Key? key,
    required this.repository,
    required this.onItemTap,
  }) : super(key: key);

  final IPokemonRepository repository;
  final Function(String, DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repository.getAllPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const PoLoading();
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return HomePage(
            pokemon: snapshot.data!,
            onItemTap: onItemTap,
          );
        }

        if (snapshot.hasError) {
          return PoError(
            error: (snapshot.error as ExceptionsError).message!,
          );
        }

        return Container();
      },
    );
  }
}
