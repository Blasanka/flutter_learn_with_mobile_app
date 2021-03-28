import 'package:flutter/material.dart';
import 'package:srp_parent_mobile/src/core/domain/entities/character.entity.dart';
import 'package:srp_parent_mobile/src/core/domain/entities/character_episode.entity.dart';
import 'package:srp_parent_mobile/src/core/domain/entities/character_location.entity.dart';
import 'package:srp_parent_mobile/src/core/localization/localization.constants.dart';
import 'package:srp_parent_mobile/src/core/presentation/base.view.dart';
import 'package:srp_parent_mobile/src/core/provider/view.state.dart';
import 'package:srp_parent_mobile/src/feature/authentication/presentation/providers/characters.provider.dart';
import 'package:srp_parent_mobile/src/feature/authentication/presentation/widgets/character_card.widget.dart';

class CharactersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<CharacterProvider>(
      onModelReady: (model) => model.fetchCharacters(),
      builder: (context, provider, child) => Scaffold(
        appBar: AppBar(
          title:
              Text(getTranslated(context, 'dashboardTitle') ?? "", style: Theme.of(context).textTheme.headline6),
          actions: <Widget>[
            InkWell(
              onTap: () async {
                provider.fetchCharacters();
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(Icons.refresh, size: 30.0),
              ),
            )
          ],
        ),
        body: provider.state == ViewState.Busy
            ? Center(
                child: CircularProgressIndicator(),
              )
            : provider.state == ViewState.Error
                ? Center(
                    child: Text(getTranslated(context, 'somethingWrong') ?? ""),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: provider.characters.length,
                    itemBuilder: (BuildContext context, int index) {
                      return provider.characters
                          .map((ch) => CharacterCard(ch))
                          .toList()[index];
                    },
                  ),
      ),
    );
  }
}
