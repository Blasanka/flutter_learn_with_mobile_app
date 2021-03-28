import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql/client.dart';
import 'package:http/http.dart' as http;
import 'package:srp_parent_mobile/src/core/network/network.info.dart';
import 'package:srp_parent_mobile/src/feature/authentication/data/datasources/characters_remote.datasource.dart';
import 'package:srp_parent_mobile/src/feature/authentication/data/repositories/characters_repository.impl.dart';
import 'package:srp_parent_mobile/src/feature/authentication/domain/repositories/characters.repository.dart';
import 'package:srp_parent_mobile/src/feature/authentication/domain/usecases/get_characters.usecase.dart';
import 'package:srp_parent_mobile/src/feature/authentication/presentation/providers/characters.provider.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Characters
  // Provider
  sl.registerLazySingleton(() => CharacterProvider());

  // Use Case
  sl.registerLazySingleton(() => GetCharactersUsecase(sl()));

  // Repository
  sl.registerLazySingleton<CharactersRepository>(
      () => CharactersRepositoryImpl(networkInfo: sl(), dataSource: sl()));

  // Data sources
  sl.registerLazySingleton<CharactersRemoteDataSource>(
      () => CharactersRemoteDataSourceImpl(sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());

  sl.registerLazySingleton(
    () => GraphQLClient(
      cache: InMemoryCache(),
      link: HttpLink(
        uri: 'https://rickandmortyapi.com/graphql',
      ),
    ),
  );
  
}
