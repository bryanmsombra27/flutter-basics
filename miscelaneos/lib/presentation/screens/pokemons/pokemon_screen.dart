import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/config/config.dart';
import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/presentation/providers/providers.dart';

class PokemonScreen extends ConsumerWidget {
  final String id;

  const PokemonScreen({super.key, required this.id});

  static const name = "pokemon_screen";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemon = ref.watch(pokemonProvider(id));

    return pokemon.when(
        data: (data) => _PokemonView(pokemon: data),
        error: (error, stacktrace) => Text(
              "error de pokemon $error",
              style: const TextStyle(fontSize: 20),
            ),
        loading: () => const CircularProgressIndicator());
  }
}

class _PokemonView extends StatelessWidget {
  final Pokemon pokemon;
  const _PokemonView({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
        actions: [
          IconButton(
            onPressed: () {
              // SharePlugin.shareLink(pokemon.spriteFront, 'Mira este pokemon');
              SharePlugin.shareLink(
                  'https://deep-linking-flutter.netlify.app/pokemons/${pokemon.id}/',
                  'Mira este pokemon');
            },
            icon: const Icon(Icons.share_outlined),
          )
        ],
      ),
      body: Center(
        child: Image.network(
          pokemon.spriteFront,
          fit: BoxFit.contain,
          width: 150,
          height: 150,
        ),
      ),
    );
  }
}
