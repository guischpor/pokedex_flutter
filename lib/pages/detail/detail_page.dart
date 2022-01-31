import 'package:flutter/material.dart';
import 'package:pokedex_flutter/core/models/pokemon_model.dart';
import 'package:pokedex_flutter/pages/detail/widgets/detail_appbar_widget.dart';
import 'widgets/detail_list_widget.dart';

class DetailsPage extends StatefulWidget {
  final Pokemon pokemon;
  final List<Pokemon> list;
  final VoidCallback onBack;
  final PageController controller;
  final ValueChanged<Pokemon> onChangedPokemon;

  const DetailsPage({
    Key? key,
    required this.pokemon,
    required this.list,
    required this.onBack,
    required this.controller,
    required this.onChangedPokemon,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  bool isOnTop = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener(
        onNotification: (notification) {
          setState(() {
            if (scrollController.position.pixels > 37) {
              isOnTop = false;
            } else if (scrollController.position.pixels <= 36) {
              isOnTop = true;
            }
          });
          return false;
        },
        child: CustomScrollView(
          controller: scrollController,
          physics: const ClampingScrollPhysics(),
          slivers: [
            DetailAppBarWidget(
              pokemon: widget.pokemon,
              onBack: widget.onBack,
              isOnTop: isOnTop,
            ),
            DetailListWidget(
              pokemon: widget.pokemon,
              list: widget.list,
              controller: widget.controller,
              onChangedPokemon: widget.onChangedPokemon,
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    Container(
                      color: widget.pokemon.baseColor,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(24),
                          topLeft: Radius.circular(24),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
