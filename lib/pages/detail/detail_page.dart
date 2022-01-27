import 'package:flutter/material.dart';
import 'package:pokedex_flutter/core/models/pokemon_model.dart';
import 'package:pokedex_flutter/widgets/app_bar.dart';

class DetailsPage extends StatelessWidget {
  final Pokemon pokemon;
  final List<Pokemon> list;

  const DetailsPage({
    Key? key,
    required this.pokemon,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: pokemon.name,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: _body(context),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 400,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: list
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(top: 32, right: 32),
                    child: Text(e.name),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
