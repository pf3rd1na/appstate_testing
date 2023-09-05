import 'package:flutter_sport_news/src/feature/dummy2/config/constants.dart';
import 'package:flutter_sport_news/src/feature/dummy2/features/countries/models/country_list_model.dart';
import 'package:http/http.dart' as http;

const String url =
    'https://apiv3.apifootball.com/?action=get_countries&APIkey=$kApiKey';

class CountriesProvider {
  static CountriesListModel? _countryList;

  static Future<CountriesListModel?> loadCountryList() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      _countryList = CountriesListModel.fromJson(response.body);
    }

    return _countryList;
  }
}
