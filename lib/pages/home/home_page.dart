import 'package:flutter/material.dart';
import 'package:pokedex_flutter/core/models/pokemon_model.dart';
import 'package:pokedex_flutter/widgets/app_bar.dart';

class HomePage extends StatelessWidget {
  final List<PokemonModel> pokemon;

  const HomePage({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: 'Home Page',
        centerTitle: true,
      ),
      body: _body(context, pokemon),
    );
  }

  Widget _body(
    BuildContext context,
    List<PokemonModel> pokemon,
  ) {
    return ListView.builder(
      itemCount: pokemon.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            pokemon[index].name,
          ),
        );
      },
    );
  }
}
