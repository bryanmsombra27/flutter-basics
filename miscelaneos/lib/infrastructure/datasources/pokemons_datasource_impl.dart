import 'package:dio/dio.dart';
import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/infrastructure/mappers/pokemon_mapper.dart';

class PokemonsDatasourceImpl implements PokemonsDatasource {
  final Dio dio;

  PokemonsDatasourceImpl()
      : dio = Dio(BaseOptions(baseUrl: 'https://pokeapi.co/api/v2'));

  @override
  Future<(Pokemon?, String)> getPokemon(String id) async {
    try {
      final response = await dio.get('/pokemon/$id');

      final pokemon = PokemonMapper.pokeApiPokemonToEntity(response.data);

      return (pokemon, "Pokemon seleccionado");
    } catch (e) {
      return (null, 'No se pudo obtener el pokemon $e');
    }
  }
}
