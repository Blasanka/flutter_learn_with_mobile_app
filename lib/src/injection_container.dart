import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql/client.dart';
import 'package:http/http.dart' as http;
import 'package:srp_parent_mobile/src/core/network/network.info.dart';
import 'package:srp_parent_mobile/src/feature/authentication/data/datasources/authentication_remote.datasource.dart';
import 'package:srp_parent_mobile/src/feature/authentication/data/repositories/authentication.repository.impl.dart';
import 'package:srp_parent_mobile/src/feature/authentication/domain/repositories/authentication.repository.dart';
import 'package:srp_parent_mobile/src/feature/authentication/domain/usecases/login.usecase.dart';
import 'package:srp_parent_mobile/src/feature/authentication/presentation/providers/auth.provider.dart';
import 'package:srp_parent_mobile/src/feature/student_list/data/datasources/student_list_remote.datasource.dart';
import 'package:srp_parent_mobile/src/feature/student_list/data/repositories/student_list.repository.impl.dart';
import 'package:srp_parent_mobile/src/feature/student_list/domain/repositories/student_list.repository.dart';
import 'package:srp_parent_mobile/src/feature/student_list/domain/usecases/get_student_list.usecase.dart';
import 'package:srp_parent_mobile/src/feature/student_list/presentation/providers/student_list.provider.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - authentication
  // Provider
  sl.registerLazySingleton(() => AuthProvider());

  // Use Case
  sl.registerLazySingleton(() => LoginUsecase(sl()));

  // Repository
  sl.registerLazySingleton<AuthenticationRepository>(
          () => AuthenticationRepositoryImpl(networkInfo: sl(), dataSource: sl()));

  // Data sources
  sl.registerLazySingleton<AuthenticationRemoteDataSource>(
          () => AuthenticationRemoteDataSourceImpl(sl()));

  //! Features - student
  // Provider
  sl.registerLazySingleton(() => StudentProvider());

  // Use Case
  sl.registerLazySingleton(() => GetStudentListUsecase(sl()));

  // Repository
  sl.registerLazySingleton<StudentRepository>(
      () => StudentListRepositoryImpl(networkInfo: sl(), dataSource: sl()));

  // Data sources
  sl.registerLazySingleton<StudentListRemoteDataSource>(
      () => StudentListRemoteDataSourceImpl(sl()));

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
