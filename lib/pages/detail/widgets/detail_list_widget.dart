import 'dart:io';

import 'package:flutter/material.dart';

import 'package:pokedex_flutter/core/models/pokemon_model.dart';

import 'detail_item_list_widget.dart';

class DetailListWidget extends StatelessWidget {
  final Pokemon pokemon;
  final List<Pokemon> list;
  final PageController controller;
  final ValueChanged<Pokemon> onChangedPokemon;

  const DetailListWidget({
    Key? key,
    required this.pokemon,
    required this.list,
    required this.controller,
    required this.onChangedPokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: pokemon.baseColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      pokemon.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    '#${pokemon.num}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: PageView(
                onPageChanged: (index) => onChangedPokemon(list[index]),
                controller: controller,
                children: list.map((p) {
                  bool diff = p.name != pokemon.name;
                  return DetailItemListWidget(
                    isDiff: diff,
                    pokemon: p,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
