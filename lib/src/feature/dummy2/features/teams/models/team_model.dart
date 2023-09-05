import 'package:flutter_sport_news/src/feature/dummy2/features/players/models/player_model.dart';

class TeamModel {
  final String key;
  final String name;
  final String logoUrl;
  final List<PlayerModel> players;

  TeamModel({
    required this.key,
    required this.name,
    required this.logoUrl,
    required this.players,
  });

  factory TeamModel.fromJson(Map<String, dynamic> json) {
    return TeamModel(
      key: json['team_key'],
      name: json['team_name'],
      logoUrl: json['team_badge'],
      players: List<PlayerModel>.from(
        json['players'].map(
          (player) => PlayerModel.fromJson(player),
        ),
      ),
    );
  }
}
