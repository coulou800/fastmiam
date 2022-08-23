import 'dart:convert';

class Item {
  String? id;
  String? name;
  String? category;
  String? providerId;
  String? price;
  String? addedTime;
  String? prepTime;

  Item({
    this.id,
    this.name,
    this.category,
    this.providerId,
    this.price,
    this.addedTime,
    this.prepTime,
  });

  factory Item.fromMap(Map<String, dynamic> data) => Item(
        id: data['id'] as String?,
        name: data['name'] as String?,
        category: data['category'] as String?,
        providerId: data['providerId'] as String?,
        price: data['price'] as String?,
        addedTime: data['addedTime'] as String?,
        prepTime: data['prepTime'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'category': category,
        'providerId': providerId,
        'price': price,
        'addedTime': addedTime,
        'prepTime': prepTime,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Item].
  factory Item.fromJson(String data) {
    return Item.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Item] to a JSON string.
  String toJson() => json.encode(toMap());
}
