import 'package:flutter/material.dart';
import 'package:flutter_sport_news/src/feature/dummy1/widgets/safe_network_image.dart';
import 'package:flutter_sport_news/src/feature/dummy2/features/players/screens/players_screen.dart';
import 'package:flutter_sport_news/src/feature/dummy2/features/teams/models/team_model.dart';
import 'package:flutter_sport_news/src/feature/dummy2/features/teams/models/teams_list_model.dart';

class TeamsList extends StatefulWidget {
  const TeamsList({
    Key? key,
    required this.teams,
  }) : super(key: key);

  final TeamsListModel teams;

  @override
  State<TeamsList> createState() => _TeamsListState();
}

class _TeamsListState extends State<TeamsList> {
  final _searchKey = GlobalKey<FormFieldState>();
  late List<TeamModel> _filteredTeams;

  void _filterTeams(String query) {
    setState(() {
      _filteredTeams = widget.teams.teams
          .where(
              (team) => team.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _openPlayersScreen(TeamModel team) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(team.name),
            ),
            body: Center(
              // child: Text('PlayersScreen'),
              child: PlayersScreen(players: team.players),
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _filteredTeams = widget.teams.teams;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: _filteredTeams.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_filteredTeams[index].name),
                leading: SafeNetworkImage(
                  url: _filteredTeams[index].logoUrl,
                  width: 50,
                  fit: BoxFit.contain,
                ),
                onTap: () {
                  _openPlayersScreen(_filteredTeams[index]);
                },
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
          child: TextFormField(
            key: _searchKey,
            onChanged: _filterTeams,
            decoration: InputDecoration(
                hintText: 'Search',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchKey.currentState!.reset();
                    _filterTeams('');
                  },
                )),
          ),
        ),
      ],
    );
  }
}
