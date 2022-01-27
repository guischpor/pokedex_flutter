import 'package:flutter/material.dart';
import 'package:pokedex_flutter/core/repositories/pokemon_repository.dart';
import 'package:pokedex_flutter/pages/detail/container/detail_container.dart';
import 'package:pokedex_flutter/pages/home/container/home_container.dart';

class PokedexRoute extends StatelessWidget {
  final PokemonRepository repository;
  const PokedexRoute({Key? key, required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) {
            return HomeContainer(
              repository: repository,
              onItemTap: (route, arguments) {
                Navigator.pushNamed(
                  context,
                  route,
                  arguments: arguments,
                );
              },
            );
          });
        }

        if (settings.name == '/details') {
          return MaterialPageRoute(builder: (context) {
            return DetailContainer(
              repository: repository,
              arguments: (settings.arguments as DetailArguments),
            );
          });
        }
      },
    );
  }
}
