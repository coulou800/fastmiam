import 'dart:convert';

import 'cart.dart';

class Client {
  String? name;
  String? gender;
  String? age;
  String? phone;
  String? address;
  Cart? cart;

  Client({
    this.name,
    this.gender,
    this.age,
    this.phone,
    this.address,
    this.cart,
  });

  factory Client.fromMap(Map<String, dynamic> data) => Client(
        name: data['name'] as String?,
        gender: data['gender'] as String?,
        age: data['age'] as String?,
        phone: data['phone'] as String?,
        address: data['address'] as String?,
        cart: data['cart'] == null
            ? null
            : Cart.fromMap(data['cart'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'gender': gender,
        'age': age,
        'phone': phone,
        'address': address,
        'cart': cart?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Client].
  factory Client.fromJson(String data) {
    return Client.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Client] to a JSON string.
  String toJson() => json.encode(toMap());
}
