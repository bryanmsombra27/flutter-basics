import 'package:flutter/material.dart';
import 'package:miscelaneos/config/config.dart';
import 'package:miscelaneos/domain/domain.dart';
import 'package:workmanager/workmanager.dart';

class DbPokemonsScreen extends StatelessWidget {
  const DbPokemonsScreen({super.key});

  static const name = "db_pokemons_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Workmanager().registerOneOffTask(
              fetchBackgroundTaskKey, fetchBackgroundTaskKey,
              initialDelay: const Duration(seconds: 3));
        },
        label: const Text("activar fetch periodico"),
        icon: const Icon(Icons.av_timer),
      ),
      appBar: AppBar(
        title: const Text("Background process"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add_alarm_sharp))
        ],
      ),
      body: CustomScrollView(
        slivers: [
          _PokemonsGrid(
            pokemons: [],
          ),
        ],
      ),
    );
  }
}

class _PokemonsGrid extends StatelessWidget {
  final List<Pokemon> pokemons;

  const _PokemonsGrid({super.key, required this.pokemons});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 2, mainAxisSpacing: 2),
        itemCount: pokemons.length,
        itemBuilder: (context, index) {
          final pokemon = pokemons[index];

          return Column(
            children: [
              Image.network(
                pokemon.spriteFront,
                fit: BoxFit.contain,
              ),
              Text(pokemon.name)
            ],
          );
        });
  }
}
