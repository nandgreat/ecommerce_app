import 'dart:convert';

Location locationFromJson(String str) => Location.fromJson(json.decode(str));
String locationToJson(Location data) => json.encode(data.toJson());
class Location {
  Location({
      String? address, 
      String? city, 
      String? state, 
      String? country, 
      num? long, 
      num? lat,}){
    _address = address;
    _city = city;
    _state = state;
    _country = country;
    _long = long;
    _lat = lat;
}

  Location.fromJson(dynamic json) {
    _address = json['address'];
    _city = json['city'];
    _state = json['state'];
    _country = json['country'];
    _long = json['long'];
    _lat = json['lat'];
  }
  String? _address;
  String? _city;
  String? _state;
  String? _country;
  num? _long;
  num? _lat;
Location copyWith({  String? address,
  String? city,
  String? state,
  String? country,
  num? long,
  num? lat,
}) => Location(  address: address ?? _address,
  city: city ?? _city,
  state: state ?? _state,
  country: country ?? _country,
  long: long ?? _long,
  lat: lat ?? _lat,
);
  String? get address => _address;
  String? get city => _city;
  String? get state => _state;
  String? get country => _country;
  num? get long => _long;
  num? get lat => _lat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address'] = _address;
    map['city'] = _city;
    map['state'] = _state;
    map['country'] = _country;
    map['long'] = _long;
    map['lat'] = _lat;
    return map;
  }

}