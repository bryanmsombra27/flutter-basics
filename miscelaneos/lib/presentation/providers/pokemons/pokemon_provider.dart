import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/infrastructure/infrastructure.dart';

final pokemonRepositoryProvider = Provider<PokemonsRepository>((ref) {
  return PokemonsRepositoryImpl();
});

final pokemonProvider = FutureProvider.family<Pokemon, String>((ref, id) async {
  final pokemonsRepository = ref.watch(pokemonRepositoryProvider);
  final (pokemon, error) = await pokemonsRepository.getPokemon(id);

  if (pokemon != null) {
    return pokemon;
  }

  throw error;
});
