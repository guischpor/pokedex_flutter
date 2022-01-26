import 'package:flutter/material.dart';
import 'package:pokedex_flutter/core/provider_list/providers_list.dart';
import 'package:pokedex_flutter/core/routes/app_routes.dart';
import 'package:pokedex_flutter/pages/home_page.dart';
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
            primarySwatch: Colors.indigo,
            accentColor: Colors.amber,
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
        routes: {
          AppRoutes.homePage: (context) => const HomePage(),
        },
      ),
    );
  }
}
