class CountryData {
  final String icao;
  final String? iata;
  final String name;
  final String city;
  final String state;
  final String country;
  final int elevation;
  final double lat;
  final double lon;
  final String tz;

  CountryData({
    required this.icao,
    this.iata,
    required this.name,
    required this.city,
    required this.state,
    required this.country,
    required this.elevation,
    required this.lat,
    required this.lon,
    required this.tz,
  });

  factory CountryData.fromJson(Map<String, dynamic> json) {
    return CountryData(
      icao: json['icao'],
      iata: json['iata'],
      name: json['name'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      elevation: json['elevation'],
      lat: json['lat'].toDouble(),
      lon: json['lon'].toDouble(),
      tz: json['tz'],
    );
  }
}
