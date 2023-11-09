class AirportModel {
  String? icao;
  String? iata;
  String? name;
  String? city;
  String? state;
  String? country;
  int? elevation;
  var lat;
  var lon;
  String? tz;

  AirportModel(
      {this.icao,
      this.iata,
      this.name,
      this.city,
      this.state,
      this.country,
      this.elevation,
      this.lat,
      this.lon,
      this.tz});

  AirportModel.fromJson(Map<String, dynamic> json) {
    icao = json['icao'];
    iata = json['iata'];
    name = json['name'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    elevation = json['elevation'];
    lat = json['lat'];
    lon = json['lon'];
    tz = json['tz'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icao'] = this.icao;
    data['iata'] = this.iata;
    data['name'] = this.name;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['elevation'] = this.elevation;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['tz'] = this.tz;
    return data;
  }
}
