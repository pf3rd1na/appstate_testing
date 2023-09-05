import 'dart:convert';

import 'league_model.dart';

class LeaguesListModel {
  final List<LeagueModel> leagues;

  LeaguesListModel({
    required this.leagues,
  });

  factory LeaguesListModel.fromJson(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return LeaguesListModel(
      leagues: parsed
          .map<LeagueModel>((json) => LeagueModel.fromJson(json))
          .toList(),
    );
  }
}
