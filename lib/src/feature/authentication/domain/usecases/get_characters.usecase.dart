import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:srp_parent_mobile/src/core/domain/entities/character.entity.dart';
import 'package:srp_parent_mobile/src/core/domain/usecases/usecase.dart';
import 'package:srp_parent_mobile/src/core/error/failures.dart';
import 'package:meta/meta.dart';
import 'package:srp_parent_mobile/src/feature/authentication/domain/repositories/characters.repository.dart';

class GetCharactersUsecase implements UseCase<List<Character>, Params>{
  final CharactersRepository repository;

  GetCharactersUsecase(this.repository);

  @override
  Future<Either<Failure, List<Character>>> call(Params params) async {
    return await repository.getCharacters(params.page);
  }
}

class Params extends Equatable {
  final int page;

  Params({required this.page});

  @override
  List<Object> get props => [page];
}