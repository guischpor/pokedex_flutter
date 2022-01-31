import 'package:flutter/material.dart';

import 'package:pokedex_flutter/core/models/pokemon_model.dart';

class DetailAppBarWidget extends StatelessWidget {
  final Pokemon pokemon;
  final VoidCallback onBack;
  final bool isOnTop;

  const DetailAppBarWidget({
    Key? key,
    required this.pokemon,
    required this.onBack,
    required this.isOnTop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      elevation: 0,
      backgroundColor: pokemon.baseColor,
      leading: IconButton(
        icon: const Icon(Icons.chevron_left),
        onPressed: onBack,
      ),
      title: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: isOnTop ? 0 : 1,
              child: Text(
                pokemon.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
    );
  }
}
