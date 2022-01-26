import 'package:flutter/material.dart';
import 'package:pokedex_flutter/widgets/app_bar.dart';

class PokedexDetailsPage extends StatelessWidget {
  const PokedexDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: 'Pokedex Details',
        centerTitle: true,
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Container();
  }
}
