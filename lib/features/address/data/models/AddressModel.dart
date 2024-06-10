class AddressModel {
  AddressModel({
      this.status, 
      this.message, 
      this.data,});

  AddressModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? status;
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.name, 
      this.city, 
      this.region, 
      this.details, 
      this.latitude, 
      this.longitude, 
      this.notes, 
      this.id,});

  Data.fromJson(dynamic json) {
    name = json['name'];
    city = json['city'];
    region = json['region'];
    details = json['details'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    notes = json['notes'];
    id = json['id'];
  }
  String? name;
  String? city;
  String? region;
  String? details;
  double? latitude;
  double? longitude;
  String? notes;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['city'] = city;
    map['region'] = region;
    map['details'] = details;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['notes'] = notes;
    map['id'] = id;
    return map;
  }

}