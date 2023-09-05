import 'package:flutter/material.dart';
import 'package:flutter_sport_news/src/feature/dummy2/features/leagues/models/leagues_list_model.dart';
import 'package:flutter_sport_news/src/feature/dummy2/features/leagues/providers/leagues_provider.dart';
import 'package:flutter_sport_news/src/feature/dummy2/features/leagues/widgets/leagues_list.dart';

class LeaguesScreen extends StatefulWidget {
  const LeaguesScreen({
    Key? key,
    required this.countryId,
  }) : super(key: key);

  final int countryId;

  @override
  State<LeaguesScreen> createState() => _LeaguesScreenState();
}

class _LeaguesScreenState extends State<LeaguesScreen> {
  bool _showLeagues = false;
  LeaguesListModel? _leagues;

  void _loadLeagues() async {
    _leagues = await LeaguesProvider.loadLeaguesList(widget.countryId);
    setState(() {
      _showLeagues = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadLeagues();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _showLeagues
          ? LeaguesList(
              leagues: _leagues!,
            )
          : const CircularProgressIndicator(),
    );
  }
}
