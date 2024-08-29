import 'package:dio/dio.dart';
import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';
import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';

class ActorMoviedbDatasource extends ActorsDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.movieDbKey,
        'language': 'es-MX'
      }));

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    try {
      final response = await dio.get('/movie/$movieId/credits');
      final castResponse = CreditsResponse.fromJson(response.data);
      final actors = castResponse.cast
          .map((cast) => ActorMaper.castToEntity(cast))
          .toList();
      return actors;
    } catch (e) {
      throw Exception('Movie with id $movieId not found');
    }
  }
}
