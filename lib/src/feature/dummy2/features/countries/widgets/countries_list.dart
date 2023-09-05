import 'package:flutter/material.dart';
import 'package:flutter_sport_news/src/feature/dummy1/widgets/safe_network_image.dart';
import 'package:flutter_sport_news/src/feature/dummy2/features/countries/models/country_list_model.dart';
import 'package:flutter_sport_news/src/feature/dummy2/features/countries/models/country_model.dart';
import 'package:flutter_sport_news/src/feature/dummy2/features/leagues/screens/leagues_screen.dart';

class CountriesList extends StatefulWidget {
  const CountriesList({
    Key? key,
    required this.countriesList,
  }) : super(key: key);

  final CountriesListModel countriesList;

  @override
  State<CountriesList> createState() => _CountriesListState();
}

class _CountriesListState extends State<CountriesList> {
  final GlobalKey<FormFieldState> _searchKey = GlobalKey<FormFieldState>();
  late List<CountryModel> _filteredCountries;

  void _filterCountries(String query) {
    setState(() {
      _filteredCountries = widget.countriesList.countries
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _openLeaguesScreen(CountryModel country) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(country.name),
            ),
            body: Center(
              child: LeaguesScreen(countryId: country.parsedId),
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _filteredCountries = widget.countriesList.countries;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: _filteredCountries.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_filteredCountries[index].name),
                  leading: SafeNetworkImage(
                    url: _filteredCountries[index].logoUrl,
                    width: 50,
                    fit: BoxFit.contain,
                  ),
                  onTap: () {
                    _openLeaguesScreen(_filteredCountries[index]);
                  },
                );
              }),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
          child: TextFormField(
            key: _searchKey,
            onChanged: _filterCountries,
            decoration: InputDecoration(
                hintText: 'Search',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchKey.currentState!.reset();
                    _filterCountries('');
                  },
                )),
          ),
        ),
      ],
    );
  }
}
