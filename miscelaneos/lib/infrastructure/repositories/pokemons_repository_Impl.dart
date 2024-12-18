import 'package:miscelaneos/domain/domain.dart';
import 'package:miscelaneos/infrastructure/datasources/pokemons_datasource_impl.dart';

class PokemonsRepositoryImpl implements PokemonsRepository {
  final PokemonsDatasource datasource;

  // Si viene el datasource implementa el que se manda por parametro caso contrario toma el datasource definido por defecto
  PokemonsRepositoryImpl([PokemonsDatasource? datasource])
      : datasource = datasource ?? PokemonsDatasourceImpl();

  @override
  Future<(Pokemon?, String)> getPokemon(String id) async {
    return datasource.getPokemon(id);
  }
}
