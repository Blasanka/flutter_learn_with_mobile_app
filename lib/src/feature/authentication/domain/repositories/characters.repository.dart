import 'package:dartz/dartz.dart';
import 'package:srp_parent_mobile/src/core/domain/entities/character.entity.dart';
import 'package:srp_parent_mobile/src/core/error/failures.dart';

abstract class CharactersRepository {
  Future<Either<Failure, List<Character>>> getCharacters(int page);
}
