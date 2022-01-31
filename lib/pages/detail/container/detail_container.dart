import 'package:flutter/material.dart';
import 'package:pokedex_flutter/core/exceptions/exception_error.dart';
import 'package:pokedex_flutter/core/models/pokemon_model.dart';
import 'package:pokedex_flutter/core/repositories/pokemon_repository.dart';
import 'package:pokedex_flutter/pages/detail/detail_page.dart';
import 'package:pokedex_flutter/widgets/po_error.dart';
import 'package:pokedex_flutter/widgets/po_loading.dart';

class DetailArguments {
  final Pokemon pokemon;
  final int? index;

  DetailArguments({
    required this.pokemon,
    this.index = 0,
  });
}

class DetailContainer extends StatefulWidget {
  const DetailContainer({
    Key? key,
    required this.repository,
    required this.arguments,
    required this.onBack,
  }) : super(key: key);

  final IPokemonRepository repository;
  final DetailArguments arguments;
  final VoidCallback onBack;

  @override
  State<DetailContainer> createState() => _DetailContainerState();
}

class _DetailContainerState extends State<DetailContainer> {
  late PageController _controller;
  Pokemon? _pokemon;

  late Future<List<Pokemon>> _future;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      viewportFraction: 0.5,
      initialPage: widget.arguments.index!,
    );
    _future = widget.repository.getAllPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future:_future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const PoLoading();
        }

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          _pokemon ??= widget.arguments.pokemon;
          return DetailsPage(
            pokemon: _pokemon!,
            list: snapshot.data!,
            onBack: widget.onBack,
            controller: _controller,
            onChangedPokemon: (Pokemon value) {
              setState(() {
                _pokemon = value;
              });
            },
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
