class UpdateProfileModel {
  UpdateProfileModel({
      this.status, 
      this.message, 
      this.data,});

  UpdateProfileModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UpdateData.fromJson(json['data']) : null;
  }
  bool? status;
  String? message;
  UpdateData? data;

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

class UpdateData {
  UpdateData({
      this.id, 
      this.name, 
      this.email, 
      this.phone, 
      this.image, 
      this.points, 
      this.credit, 
      this.token,});

  UpdateData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  dynamic points;
  dynamic credit;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['image'] = image;
    map['points'] = points;
    map['credit'] = credit;
    map['token'] = token;
    return map;
  }

}