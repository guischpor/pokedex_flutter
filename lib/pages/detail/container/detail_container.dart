import 'package:flutter/material.dart';
import 'package:pokedex_flutter/core/exceptions/exception_error.dart';
import 'package:pokedex_flutter/core/models/pokemon_model.dart';
import 'package:pokedex_flutter/core/repositories/pokemon_repository.dart';
import 'package:pokedex_flutter/pages/detail/detail_page.dart';
import 'package:pokedex_flutter/widgets/po_error.dart';
import 'package:pokedex_flutter/widgets/po_loading.dart';

class DetailArguments {
  final Pokemon pokemon;

  DetailArguments({required this.pokemon});
}

class DetailContainer extends StatelessWidget {
  const DetailContainer({
    Key? key,
    required this.repository,
    required this.arguments,
  }) : super(key: key);

  final IPokemonRepository repository;
  final DetailArguments arguments;

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
          return DetailsPage(
            pokemon: arguments.pokemon,
            list: snapshot.data!,
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
