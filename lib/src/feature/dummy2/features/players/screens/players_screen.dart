import 'package:flutter/material.dart';
import 'package:flutter_sport_news/src/feature/dummy1/widgets/safe_network_image.dart';
import 'package:flutter_sport_news/src/feature/dummy2/features/players/models/player_model.dart';
import 'package:flutter_sport_news/src/feature/dummy2/features/players/screens/player_screen.dart';

class PlayersScreen extends StatelessWidget {
  const PlayersScreen({
    Key? key,
    required this.players,
  }) : super(key: key);

  final List<PlayerModel> players;

  void _openPlayerScreen(BuildContext context, PlayerModel player) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(player.name),
            ),
            body: Center(
                // child: Text('PlayerScreen'),
                child: PlayerScreen(
              player: player,
            )),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: players.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(players[index].name),
          leading: Hero(
            tag: players[index].imageUrl,
            child: SafeNetworkImage(
              url: players[index].imageUrl,
              width: 50,
              fit: BoxFit.contain,
            ),
          ),
          trailing: Text(players[index].number),
          // onTap: () {
          //   _openPlayerScreen(context, players[index]);
          // },
        );
      },
    );
  }
}
