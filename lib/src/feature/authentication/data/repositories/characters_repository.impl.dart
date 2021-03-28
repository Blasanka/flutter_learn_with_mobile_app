import 'package:meta/meta.dart';
import 'package:srp_parent_mobile/src/core/error/exception.dart';
import 'package:srp_parent_mobile/src/core/error/failures.dart';
import 'package:srp_parent_mobile/src/core/domain/entities/character.entity.dart';
import 'package:dartz/dartz.dart';
import 'package:srp_parent_mobile/src/core/network/network.info.dart';
import 'package:srp_parent_mobile/src/feature/authentication/data/datasources/characters_remote.datasource.dart';
import 'package:srp_parent_mobile/src/feature/authentication/domain/repositories/characters.repository.dart';

class CharactersRepositoryImpl implements CharactersRepository {
  final NetworkInfo networkInfo;
  final CharactersRemoteDataSource dataSource;

  CharactersRepositoryImpl({
    required this.networkInfo,
    required this.dataSource,
  });

  @override
  Future<Either<Failure, List<Character>>> getCharacters(int page) async {
    if (await networkInfo.isConnected == false) {
      return Left(NetworkFailure());
    }
    try {
      return Right(await dataSource.getCharacters(page));
    } on ServerException {
      return Left(ServerFailure());
    }
    
  }
}
