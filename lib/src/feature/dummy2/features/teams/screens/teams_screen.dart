import 'package:flutter/material.dart';
import 'package:flutter_sport_news/src/feature/dummy2/features/teams/models/teams_list_model.dart';
import 'package:flutter_sport_news/src/feature/dummy2/features/teams/providers/teams_provider.dart';
import 'package:flutter_sport_news/src/feature/dummy2/features/teams/widgets/teams_list.dart';

class TeamsScreen extends StatefulWidget {
  const TeamsScreen({
    Key? key,
    required this.leagueId,
  }) : super(key: key);

  final int leagueId;

  @override
  State<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> {
  bool _showTeams = false;
  TeamsListModel? _teams;

  void _loadTeams() async {
    _teams = await TeamProvider.loadTeamsList(widget.leagueId);
    setState(() {
      _showTeams = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadTeams();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _showTeams
          ? TeamsList(teams: _teams!)
          : const CircularProgressIndicator(),
    );
  }
}
