class Location {
  String country;
  double? lat;
  String? localtime;
  int? localtimeEpoch;
  double? lon;
  String name;
  String? region;
  String? tzId;

  Location(
      {required this.country,
      this.lat,
      this.localtime,
      this.localtimeEpoch,
      this.lon,
      required this.name,
      this.region,
      this.tzId});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      country: json['country'],
      lat: json['lat'],
      localtime: json['localtime'],
      localtimeEpoch: json['localtime_epoch'],
      lon: json['lon'],
      name: json['name'],
      region: json['region'],
      tzId: json['tz_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = country;
    data['lat'] = lat;
    data['localtime'] = localtime;
    data['localtime_epoch'] = localtimeEpoch;
    data['lon'] = lon;
    data['name'] = name;
    data['region'] = region;
    data['tz_id'] = tzId;
    return data;
  }
}

class PositionParameters {
  String name;
  double? lat;
  double? lon;

  PositionParameters({this.lon, this.lat, this.name = ''});
}
