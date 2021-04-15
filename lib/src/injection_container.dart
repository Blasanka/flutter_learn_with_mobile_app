import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:srp_parent_mobile/src/core/data/datasources/local/storage.helper.dart';
import 'package:srp_parent_mobile/src/core/network/network.info.dart';
import 'package:srp_parent_mobile/src/core/provider/theme.provider.dart';
import 'package:srp_parent_mobile/src/feature/authentication/data/datasources/authentication_remote.datasource.dart';
import 'package:srp_parent_mobile/src/feature/authentication/data/repositories/authentication.repository.impl.dart';
import 'package:srp_parent_mobile/src/feature/authentication/domain/repositories/authentication.repository.dart';
import 'package:srp_parent_mobile/src/feature/authentication/domain/usecases/login.usecase.dart';
import 'package:srp_parent_mobile/src/feature/authentication/presentation/providers/auth.provider.dart';
import 'package:srp_parent_mobile/src/feature/calendar/data/datasources/remote/notices.datasource.dart';
import 'package:srp_parent_mobile/src/feature/calendar/data/repositories/events.repository.dart';
import 'package:srp_parent_mobile/src/feature/calendar/domain/usecases/get_events.usecase.dart';
import 'package:srp_parent_mobile/src/feature/calendar/presentation/providers/calendar.provider.dart';
import 'package:srp_parent_mobile/src/feature/notices/data/datasources/remote/notices.datasource.dart';
import 'package:srp_parent_mobile/src/feature/notices/data/repositories/notices.repository.dart';
import 'package:srp_parent_mobile/src/feature/notices/domain/usecases/get_notices.usecase.dart';
import 'package:srp_parent_mobile/src/feature/notices/presentation/providers/notices.provider.dart';
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


  //! Features - notices
  // Provider
  sl.registerLazySingleton(() => NoticesProvider());

  // Use Case
  sl.registerLazySingleton(() => GetNoticesUsecase(sl()));

  // Repository
  sl.registerLazySingleton<NoticesRepositoryImpl>(
          () => NoticesRepositoryImpl(networkInfo: sl(), dataSource: sl()));

  // Data sources
  sl.registerLazySingleton<NoticesRemoteDataSourceImpl>(
          () => NoticesRemoteDataSourceImpl(sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());

  //! Features - events
  // Provider
  sl.registerLazySingleton(() => CalendarProvider());

  // Use Case
  sl.registerLazySingleton(() => GetEventsUsecase(sl()));

  // Repository
  sl.registerLazySingleton<EventsRepositoryImpl>(
          () => EventsRepositoryImpl(networkInfo: sl(), dataSource: sl()));

  // Data sources
  sl.registerLazySingleton<EventsRemoteDataSourceImpl>(
          () => EventsRemoteDataSourceImpl(sl()));

  // sl.registerLazySingleton(
  //   () => GraphQLClient(
  //     cache: InMemoryCache(),
  //     link: HttpLink(
  //       uri: 'https://rickandmortyapi.com/graphql',
  //     ),
  //   ),
  // );

  // Device specific datasources
  sl.registerLazySingleton(() => StorageHelper());

  // Device specific Providers
  sl.registerLazySingleton(() => ThemeProvider(cacheManager: sl()));
}
