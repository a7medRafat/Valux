class OrderModel {
  OrderModel({
    this.name,
    this.date,
    this.id,
    this.totalPrice,
    this.payment,
    this.address,
    this.product,
  });

  OrderModel.fromJson(dynamic json) {
    name = json['name'];
    date = json['date'];
    id = json['id'];
    totalPrice = json['totalPrice'];
    payment = json['payment'];
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    if (json['product'] != null) {
      product = [];
      json['product'].forEach((v) {
        product?.add(ProductOrder.fromJson(v));
      });
    }
  }

  String? name;
  String? date;
  int? id;
  dynamic totalPrice;
  String? payment;
  Address? address;
  List<ProductOrder>? product;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['date'] = date;
    map['id'] = id;
    map['totalPrice'] = totalPrice;
    map['payment'] = payment;
    if (address != null) {
      map['address'] = address?.toJson();
    }
    if (product != null) {
      map['product'] = product?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class ProductOrder {
  ProductOrder({
    this.price,
    this.image,
    this.name,
    this.quantity,
  });

  ProductOrder.fromJson(dynamic json) {
    price = json['price'];
    image = json['image'];
    name = json['name'];
    quantity = json['quantity'];
  }

  dynamic price;
  String? image;
  String? name;
  String? quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['price'] = price;
    map['image'] = image;
    map['name'] = name;
    map['quantity'] = quantity;

    return map;
  }
}

class Address {
  Address({
    this.city,
    this.region,
    this.details,
  });

  Address.fromJson(dynamic json) {
    city = json['city'];
    region = json['region'];
    details = json['details'];
  }

  String? city;
  String? region;
  String? details;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['city'] = city;
    map['region'] = region;
    map['details'] = details;
    return map;
  }
}
