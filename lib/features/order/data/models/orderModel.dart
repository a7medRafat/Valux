class OrderModel {
  OrderModel({
    required this.id,
    required this.price,
    required this.quantity,
    required this.image,
    required this.name,
    required this.city,
    required this.regan,
    required this.details,
    required this.date,
    required this.totalPrice,
    required this.payment,
  });

  int? id;
  int? quantity;
  dynamic price;
  dynamic date;
  dynamic totalPrice;
  String? image;
  String? name;
  String? city;
  String? regan;
  String? details;
  String? payment;

  OrderModel.fromJson(dynamic json) {
    id = json['id'];
    quantity = json['quantity'];
    price = json['price'];
    date = json['date'];
    totalPrice = json['totalPrice'];
    name = json['name'];
    city = json['city'];
    regan = json['regan'];
    details = json['details'];
    payment = json['payment'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['quantity'] = quantity;
    map['price'] = price;
    map['date'] = date;
    map['totalPrice'] = totalPrice;
    map['name'] = name;
    map['city'] = city;
    map['regan'] = regan;
    map['details'] = details;
    map['payment'] = payment;

    return map;
  }
}
