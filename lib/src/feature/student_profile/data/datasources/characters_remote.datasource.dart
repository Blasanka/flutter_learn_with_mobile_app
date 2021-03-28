import 'package:graphql/client.dart';
import 'package:srp_parent_mobile/src/core/data/models/character.model.dart';
import 'package:srp_parent_mobile/src/core/domain/entities/character.entity.dart';
import 'package:srp_parent_mobile/src/core/error/exception.dart';

abstract class CharactersRemoteDataSource {
  /// Queries GQL characters by page
  ///
  /// Throws a [ServerException] for all error codes
  Future<List<Character>> getCharacters(int page);
}

class CharactersRemoteDataSourceImpl implements CharactersRemoteDataSource {
  final GraphQLClient graphQLClient;

  CharactersRemoteDataSourceImpl(this.graphQLClient);

  @override
  Future<List<Character>> getCharacters(int page) async {
    List<Character> characters = [];
    const String readCharacters = r'''
        query characters ($nPage: Int){
          characters (page: $nPage) {
            info {
              pages
              next
            }
            results {
              id
              name
              gender
              image
              status
              species
              type
              origin {
                name
              }
              location {
                id
                name
              }
              episode {
                name
                episode
              }
            }
          }
        }
      ''';

    final QueryOptions options = QueryOptions(
      documentNode: gql(readCharacters),
      variables: {
        'nPage': page,
      },
    );

    final QueryResult result = await graphQLClient.query(options);

    if (result.hasException) {
      print(result.exception.toString());
      throw ServerException();
    }
    
   for (var jsonMap in (result.data['characters']['results'] as List<dynamic>)) {
     characters.add(CharacterModel.fromJson(jsonMap));
   }
    return characters;
  }
}
