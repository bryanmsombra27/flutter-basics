import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class PokemonsScreen extends StatelessWidget {
  const PokemonsScreen({super.key});

  static const name = "pokemons_screen";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PokemonView(),
    );
  }
}

class PokemonView extends ConsumerStatefulWidget {
  const PokemonView({super.key});

  @override
  PokemonViewState createState() => PokemonViewState();
}

class PokemonViewState extends ConsumerState<PokemonView> {
  final scrollController = ScrollController();

  void infiniteScroll() {
    final currentPokemons = ref.read(pokemonsIdsProvider);

    if (currentPokemons.length > 400) {
      scrollController.removeListener(infiniteScroll);
      return;
    }
    if ((scrollController.position.pixels + 200) >
        scrollController.position.maxScrollExtent) {
      ref.read(pokemonsIdsProvider.notifier).update((state) => [
            ...state,
            ...List.generate(30, (index) => state.length + index + 1)
          ]);
    }
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(infiniteScroll);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          title: const Text('Pokemons'),
          floating: true,
          backgroundColor: Colors.white.withValues(alpha: .8),
        ),
        const _PokemonGrid()
      ],
    );
  }
}

class _PokemonGrid extends ConsumerWidget {
  const _PokemonGrid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonsAmount = ref.watch(pokemonsIdsProvider).length;

    return SliverGrid.builder(
      itemCount: pokemonsAmount,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 2, mainAxisSpacing: 2),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            context.push('/pokemons/${index + 1}');
          },
          child: Container(
            margin: const EdgeInsets.all(5),
            // color: Colors.blue,
            child: Image.network(
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/${index + 1}.png',
              fit: BoxFit.contain,
            ),
          ),
        );
      },
    );
  }
}
