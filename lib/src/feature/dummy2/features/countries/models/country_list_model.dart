import 'dart:convert';

import 'package:flutter_sport_news/src/feature/dummy2/features/countries/models/country_model.dart';

class CountriesListModel {
  final List<CountryModel> countries;

  CountriesListModel({
    required this.countries,
  });

  factory CountriesListModel.fromJson(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return CountriesListModel(
      countries: parsed
          .map<CountryModel>((json) => CountryModel.fromJson(json))
          .toList(),
    );
  }
}
