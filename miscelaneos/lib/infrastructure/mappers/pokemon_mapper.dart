import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/infrastructure/models/pokeapi_reponse.dart';

class PokemonMapper {
  static Pokemon pokeApiPokemonToEntity(Map<String, dynamic> json) {
    final pokeApiPokemon = PokemonResponse.fromJson(json);

    return Pokemon(
        id: pokeApiPokemon.id,
        name: pokeApiPokemon.name,
        spriteFront: pokeApiPokemon.sprites.frontDefault);
  }
}
