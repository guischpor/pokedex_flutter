import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_flutter/core/provider_list/providers_list.dart';
import 'package:pokedex_flutter/core/repositories/pokemon_repository.dart';
import 'package:pokedex_flutter/core/routes/route.dart';
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
        home: PokedexRoute(
          repository: PokemonRepository(dio: Dio()),
        ),
      ),
    );
  }
}
