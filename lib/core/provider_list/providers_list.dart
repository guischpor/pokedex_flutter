import 'package:pokedex_flutter/pages/home/provider/poke_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProvidersList {
  final List<SingleChildWidget> providers = [
    ChangeNotifierProvider(
      create: (_) => PokeProvider(),
    ),
  ];
}
