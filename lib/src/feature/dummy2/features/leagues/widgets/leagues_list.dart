import 'package:flutter/material.dart';
import 'package:flutter_sport_news/src/feature/dummy1/widgets/safe_network_image.dart';
import 'package:flutter_sport_news/src/feature/dummy2/features/leagues/models/league_model.dart';
import 'package:flutter_sport_news/src/feature/dummy2/features/leagues/models/leagues_list_model.dart';
import 'package:flutter_sport_news/src/feature/dummy2/features/teams/screens/teams_screen.dart';

class LeaguesList extends StatefulWidget {
  const LeaguesList({
    Key? key,
    required this.leagues,
  }) : super(key: key);

  final LeaguesListModel leagues;

  @override
  State<LeaguesList> createState() => _LeaguesListState();
}

class _LeaguesListState extends State<LeaguesList> {
  final GlobalKey<FormFieldState> _searchKey = GlobalKey<FormFieldState>();
  late List<LeagueModel> _filteredLeagues;

  void _filterLeagues(String query) {
    setState(() {
      _filteredLeagues = widget.leagues.leagues
          .where((element) =>
              element.leagueName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _openTeamsScreen(LeagueModel league) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(league.leagueName),
            ),
            body: Center(child: TeamsScreen(leagueId: league.parsedLeagueId)),
            // child: Text('TeamsScreen')),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _filteredLeagues = widget.leagues.leagues;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: _filteredLeagues.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: SafeNetworkImage(
                  url: _filteredLeagues[index].leagueLogo,
                  width: 50,
                  fit: BoxFit.contain,
                ),
                title: Text(_filteredLeagues[index].leagueName),
                onTap: () {
                  _openTeamsScreen(_filteredLeagues[index]);
                },
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
          child: TextFormField(
            key: _searchKey,
            onChanged: _filterLeagues,
            decoration: InputDecoration(
                hintText: 'Search',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchKey.currentState!.reset();
                    _filterLeagues('');
                  },
                )),
          ),
        ),
      ],
    );
  }
}
