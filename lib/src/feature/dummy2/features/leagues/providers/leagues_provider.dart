import 'package:flutter_sport_news/src/feature/dummy2/config/constants.dart';
import 'package:flutter_sport_news/src/feature/dummy2/features/leagues/models/leagues_list_model.dart';
import 'package:http/http.dart' as http;

const String url =
    'https://apiv3.apifootball.com/?action=get_leagues&APIkey=$kApiKey';

class LeaguesProvider {
  static LeaguesListModel? _leaguesList;

  static Future<LeaguesListModel?> loadLeaguesList(int countryId) async {
    final finalUrl = '$url&country_id=$countryId';
    final response = await http.get(Uri.parse(finalUrl));

    if (response.statusCode == 200) {
      _leaguesList = LeaguesListModel.fromJson(response.body);
    }

    return _leaguesList;
  }
}
