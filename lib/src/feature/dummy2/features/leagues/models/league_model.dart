class LeagueModel {
  String countryId;
  String countryName;
  String leagueId;
  String leagueName;
  String leagueSeason;
  String leagueLogo;
  String countryLogo;

  int get parsedLeagueId => int.tryParse(leagueId) ?? -1;

  LeagueModel({
    required this.countryId,
    required this.countryName,
    required this.leagueId,
    required this.leagueName,
    required this.leagueSeason,
    required this.leagueLogo,
    required this.countryLogo,
  });

  factory LeagueModel.fromJson(Map<String, dynamic> json) => LeagueModel(
        countryId: json["country_id"],
        countryName: json["country_name"],
        leagueId: json["league_id"],
        leagueName: json["league_name"],
        leagueSeason: json["league_season"],
        leagueLogo: json["league_logo"],
        countryLogo: json["country_logo"],
      );
}
