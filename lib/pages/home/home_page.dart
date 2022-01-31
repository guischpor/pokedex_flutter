import 'package:flutter/material.dart';
import 'package:pokedex_flutter/core/models/pokemon_model.dart';
import 'package:pokedex_flutter/pages/detail/container/detail_container.dart';
import 'package:pokedex_flutter/pages/home/widgets/pokemon_item_widget.dart';
import 'package:pokedex_flutter/widgets/app_bar.dart';

class HomePage extends StatelessWidget {
  final List<Pokemon> pokemon;
  final Function(String, DetailArguments) onItemTap;

  const HomePage({
    Key? key,
    required this.pokemon,
    required this.onItemTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(
          title: 'Pokedex',
          fontSize: 26,
          titleColor: Colors.black,
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
            )
          ]),
      body: _body(context, pokemon),
    );
  }

  Widget _body(
    BuildContext context,
    List<Pokemon> list,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 2,
      ),
      child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: list
              .map((e) => PokemonItemWidget(
                    pokemon: e,
                    onTap: onItemTap,
                    index: list.indexOf(e),
                  ))
              .toList()),
    );
  }
}
