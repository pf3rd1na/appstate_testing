class PlayerModel {
  final String id;
  final int key;
  final String imageUrl;
  final String name;
  final String number;
  final String country;
  final String type;
  final String age;
  final String mathesPlayed;
  final String goals;
  final String yellowCards;
  final String redCards;
  final String injured;
  final String substituteOut;
  final String substitutesOnBench;
  final String assists;
  final String isCaptain;
  final String shotsTotal;
  final String goalsConceded;
  final String foulsCommitted;
  final String tackles;
  final String blocks;
  final String crosses;
  final String interceptions;
  final String clearances;
  final String dispossesed;
  final String saves;
  final String insideBoxSaves;
  final String duels;
  final String duelsWon;
  final String dribbleAttempts;
  final String dribbleSuccess;
  final String penComm;
  final String penWon;
  final String penScored;
  final String penMissed;
  final String passes;
  final String passesAccuracy;
  final String keyPasses;
  final String woordworks;
  final String rating;

  // int get parsedId => int.tryParse(id) ?? -1;
  // int get parsedNumber => int.tryParse(number) ?? -1;
  // int get parsedAge => int.tryParse(age) ?? -1;
  // int get parsedMathesPlayed => int.tryParse(mathesPlayed) ?? -1;

  // bool get parsedInjured => injured == 'Yes' ? true : false;
  // bool get parsedIsCapitan => isCapitan == '1' ? true : false;

  PlayerModel({
    required this.key,
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.number,
    required this.country,
    required this.type,
    required this.age,
    required this.mathesPlayed,
    required this.goals,
    required this.yellowCards,
    required this.redCards,
    required this.injured,
    required this.substituteOut,
    required this.substitutesOnBench,
    required this.assists,
    required this.isCaptain,
    required this.shotsTotal,
    required this.goalsConceded,
    required this.foulsCommitted,
    required this.tackles,
    required this.blocks,
    required this.crosses,
    required this.interceptions,
    required this.clearances,
    required this.dispossesed,
    required this.saves,
    required this.insideBoxSaves,
    required this.duels,
    required this.duelsWon,
    required this.dribbleAttempts,
    required this.dribbleSuccess,
    required this.penComm,
    required this.penWon,
    required this.penScored,
    required this.penMissed,
    required this.passes,
    required this.passesAccuracy,
    required this.keyPasses,
    required this.woordworks,
    required this.rating,
  });

  factory PlayerModel.fromJson(Map<String, dynamic> json) => PlayerModel(
        key: json["player_key"],
        id: json["player_id"],
        imageUrl: json["player_image"],
        name: json["player_name"],
        number: json["player_number"],
        country: json["player_country"],
        type: json["player_type"],
        age: json["player_age"],
        mathesPlayed: json["player_match_played"],
        goals: json["player_goals"],
        yellowCards: json["player_yellow_cards"],
        redCards: json["player_red_cards"],
        injured: json["player_injured"],
        substituteOut: json["player_substitute_out"],
        substitutesOnBench: json["player_substitutes_on_bench"],
        assists: json["player_assists"],
        isCaptain: json["player_is_captain"],
        shotsTotal: json["player_shots_total"],
        goalsConceded: json["player_goals_conceded"],
        foulsCommitted: json["player_fouls_committed"],
        tackles: json["player_tackles"],
        blocks: json["player_blocks"],
        crosses: json["player_crosses_total"],
        interceptions: json["player_interceptions"],
        clearances: json["player_clearances"],
        dispossesed: json["player_dispossesed"],
        saves: json["player_saves"],
        insideBoxSaves: json["player_inside_box_saves"],
        duels: json["player_duels_total"],
        duelsWon: json["player_duels_won"],
        dribbleAttempts: json["player_dribble_attempts"],
        dribbleSuccess: json["player_dribble_succ"],
        penComm: json["player_pen_comm"],
        penWon: json["player_pen_won"],
        penScored: json["player_pen_scored"],
        penMissed: json["player_pen_missed"],
        passes: json["player_passes"],
        passesAccuracy: json["player_passes_accuracy"],
        keyPasses: json["player_key_passes"],
        woordworks: json["player_woordworks"],
        rating: json["player_rating"],
      );
}
