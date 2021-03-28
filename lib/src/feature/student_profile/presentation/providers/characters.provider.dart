import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:srp_parent_mobile/src/core/domain/entities/character.entity.dart';
import 'package:srp_parent_mobile/src/core/error/failures.dart';
import 'package:srp_parent_mobile/src/core/provider/base.provider.dart';
import 'package:srp_parent_mobile/src/core/provider/view.state.dart';
import 'package:srp_parent_mobile/src/feature/authentication/domain/usecases/get_characters.usecase.dart';
import 'package:srp_parent_mobile/src/injection_container.dart';

class CharacterProvider extends BaseProvider {
  GetCharactersUsecase _charactersUsecase = sl<GetCharactersUsecase>();
  Random _random = Random();
  List<Character> _characters = [];

  List<Character> get characters => _characters;

  Future<void> fetchCharacters() async {
    setState(ViewState.Busy);
    
    int randomNumber = _random.nextInt(30) + 1;
    
    Either<Failure, List<Character>> results = await _charactersUsecase(Params(page: randomNumber));

    results.fold(
      (failure) {
        setState(ViewState.Error);
      },
      (List<Character> characters) {
        _characters = characters;
        setState(ViewState.Idle);
      },
    );
  }
}
