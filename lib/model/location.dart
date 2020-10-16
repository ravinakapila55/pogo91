class Location {
  String address;
  double latitude;
  double longitude;
  int id;

  Location() {}

  Location.fromJson(Map<String, dynamic> json)
      : address = json['address'],
        latitude = json['latitude'],
        longitude = json['longitude'];

  Map<String, dynamic> toJson() => {
        'address': address,
        'latitude': latitude,
        'longitude': longitude,
      };
}
