class AddressBody {
  AddressBody({
    this.name,
    this.city,
    this.region,
    this.details,
    this.latitude,
    this.longitude,
    this.notes,
  });

  String? name;
  String? city;
  String? region;
  String? details;
  double? latitude;
  double? longitude;
  String? notes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['city'] = city;
    map['region'] = region;
    map['details'] = details;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['notes'] = notes;
    return map;
  }
}
