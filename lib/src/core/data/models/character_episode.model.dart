import 'package:meta/meta.dart';
import 'package:srp_parent_mobile/src/core/domain/entities/character_episode.entity.dart';

class CharacterEpisodeModel extends CharacterEpisode {
  CharacterEpisodeModel({
    required String name,
    required String episode,
  }): super(name: name, episode: episode);

  factory CharacterEpisodeModel.fromJson(Map<String, dynamic> jsonMap) {
    return CharacterEpisodeModel(name: jsonMap['name'], episode: jsonMap['episode']);
  }
}