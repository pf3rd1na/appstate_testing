import 'package:flutter_sport_news/src/feature/dummy2/config/constants.dart';
import 'package:flutter_sport_news/src/feature/dummy2/features/teams/models/teams_list_model.dart';
import 'package:http/http.dart' as http;

const String url =
    'https://apiv3.apifootball.com/?action=get_teams&APIkey=$kApiKey';

class TeamProvider {
  static TeamsListModel? _teams;

  static Future<TeamsListModel?> loadTeamsList(int leagueId) async {
    final finalUrl = '$url&league_id=$leagueId';
    final response = await http.get(Uri.parse(finalUrl));

    if (response.statusCode == 200) {
      _teams = TeamsListModel.fromJson(response.body);
    }

    return _teams;
  }
}
