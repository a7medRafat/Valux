class RegisterBody {
  RegisterBody({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
  });

  bool? status;
  String? name;
  String? message;
  String? phone;
  String? email;
  dynamic password;

  RegisterBody.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['phone'] = phone;
    map['email'] = email;
    map['password'] = password;

    return map;
  }
}
