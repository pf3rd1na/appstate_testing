import 'package:flutter/widgets.dart';
import 'package:flutter_sport_news/src/feature/dummy1/widgets/safe_network_image.dart';
import 'package:flutter_sport_news/src/feature/dummy2/features/players/models/player_model.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({
    Key? key,
    required this.player,
  }) : super(key: key);

  final PlayerModel player;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Hero(
          tag: player.imageUrl,
          child: SafeNetworkImage(
            url: player.imageUrl,
            width: double.infinity,
            fit: BoxFit.contain,
          ),
        ),
        Text(player.name),
      ],
    );
  }
}
