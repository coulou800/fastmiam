import 'dart:convert';

import 'item.dart';

class Cart {
  String? total;
  int? count;
  String? lastUpdateTime;
  List<Item>? items;

  Cart({this.total, this.count, this.lastUpdateTime, this.items});

  factory Cart.fromMap(Map<String, dynamic> data) => Cart(
        total: data['total'] as String?,
        count: data['count'] as int?,
        lastUpdateTime: data['lastUpdateTime'] as String?,
        items: (data['items'] as List<dynamic>?)
            ?.map((e) => Item.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'total': total,
        'count': count,
        'lastUpdateTime': lastUpdateTime,
        'items': items?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Cart].
  factory Cart.fromJson(String data) {
    return Cart.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Cart] to a JSON string.
  String toJson() => json.encode(toMap());
}
