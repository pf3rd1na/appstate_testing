class CountryModel {
  final String id;
  final String name;
  final String logoUrl;

  int get parsedId => int.tryParse(id) ?? -1;

  CountryModel({
    required this.id,
    required this.name,
    required this.logoUrl,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        id: json["country_id"],
        name: json["country_name"],
        logoUrl: json["country_logo"],
      );
}
