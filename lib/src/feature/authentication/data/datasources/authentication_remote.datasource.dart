import 'package:graphql/client.dart';
import 'package:srp_parent_mobile/src/core/data/models/user.model.dart';
import 'package:srp_parent_mobile/src/core/domain/entities/user.entity.dart';
import 'package:srp_parent_mobile/src/core/error/exception.dart';

abstract class AuthenticationRemoteDataSource {
  /// Queries GQL student by page
  ///
  /// Throws a [ServerException] for all error codes
  Future<User> login();
}

class AuthenticationRemoteDataSourceImpl implements AuthenticationRemoteDataSource {
  final GraphQLClient graphQLClient;

  AuthenticationRemoteDataSourceImpl(this.graphQLClient);

  @override
  Future<User> login() async {
    UserModel? user;
    const String readStudent = r'''
        query student ($nPage: Int){
          student (page: $nPage) {
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
      documentNode: gql(readStudent),
      variables: {
        'nPage': 0,
      },
    );

    final QueryResult result = await graphQLClient.query(options);

    if (result.hasException) {
      print(result.exception.toString());
      throw ServerException();
    }
    
   for (var jsonMap in (result.data['student']['results'] as List<dynamic>)) {
     user = UserModel.fromJson(jsonMap);
   }
    return user!;
  }
}
