import 'package:flutter/material.dart';
import 'package:flutter_sport_news/src/feature/dummy2/features/countries/models/country_list_model.dart';
import 'package:flutter_sport_news/src/feature/dummy2/features/countries/providers/countires_provider.dart';
import 'package:flutter_sport_news/src/feature/dummy2/features/countries/widgets/countries_list.dart';

class ContriesScreen extends StatefulWidget {
  const ContriesScreen({Key? key}) : super(key: key);

  @override
  State<ContriesScreen> createState() => _ContriesScreenState();
}

class _ContriesScreenState extends State<ContriesScreen> {
  bool _showCountries = false;
  CountriesListModel? _countriesList;

  void _loadCountries() async {
    _countriesList = await CountriesProvider.loadCountryList();
    setState(() {
      _showCountries = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadCountries();
  }

  @override
  Widget build(BuildContext context) {
    return _showCountries
        ? Center(child: CountriesList(countriesList: _countriesList!))
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
