import 'package:flutter/material.dart';
import 'package:pokedex_flutter/core/provider_list/providers_list.dart';
import 'package:pokedex_flutter/core/repositories/pokemon_repository.dart';
import 'package:pokedex_flutter/core/routes/app_routes.dart';
import 'package:pokedex_flutter/pages/home/container/home_container.dart';
import 'package:pokedex_flutter/pages/home/home_page.dart';
import 'package:pokedex_flutter/pages/detail/pokedex_details.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final list = ProvidersList();
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: list.providers,
      child: MaterialApp(
        title: 'Pokedex 2022',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.red,
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: HomeContainer(
          repository: PokemonRepository(),
        ),
        routes: {
          AppRoutes.homePage: (context) => const HomePage(pokemon: []),
          AppRoutes.pokedexDetailsPage: (context) => const PokedexDetailsPage(),
        },
      ),
    );
  }
}
