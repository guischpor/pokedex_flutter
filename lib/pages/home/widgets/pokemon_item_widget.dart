import 'package:flutter/material.dart';
import 'package:pokedex_flutter/core/models/pokemon_model.dart';
import 'package:pokedex_flutter/pages/detail/container/detail_container.dart';
import 'package:pokedex_flutter/pages/home/widgets/type_widget.dart';

class PokemonItemWidget extends StatelessWidget {
  final Pokemon pokemon;
  final Function(String, DetailArguments) onTap;

  const PokemonItemWidget({
    Key? key,
    required this.pokemon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.black.withOpacity(0.6),
      borderRadius: BorderRadius.circular(16),
      onTap: () => onTap(
        '/details',
        DetailArguments(pokemon: pokemon),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: pokemon.baseColor!.withOpacity(0.8),
                borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          pokemon.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Text(
                        '#${pokemon.num}',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: pokemon.type
                            .map((e) => TypeWidget(
                                  name: e,
                                ))
                            .toList(),
                      ),
                      const Flexible(
                        child: SizedBox(
                          height: 100,
                          width: 100,
                        ),
                      ),
                      // Flexible(
                      //   child: Image.network(pokemon.image),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 12,
            right: 10,
            child: Image.network(
              pokemon.image,
              height: 105,
            ),
          ),
        ],
      ),
    );
  }
}
