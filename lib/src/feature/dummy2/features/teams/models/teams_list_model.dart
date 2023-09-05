import 'dart:convert';

import 'package:flutter_sport_news/src/feature/dummy2/features/teams/models/team_model.dart';

class TeamsListModel {
  final List<TeamModel> teams;

  TeamsListModel({
    required this.teams,
  });

  static TeamsListModel? fromJson(String body) {
    final parsed = json.decode(body).cast<Map<String, dynamic>>();
    return TeamsListModel(
      teams: parsed.map<TeamModel>((json) => TeamModel.fromJson(json)).toList(),
    );
  }
}
