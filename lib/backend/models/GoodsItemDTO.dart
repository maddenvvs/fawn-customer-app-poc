import 'package:flutter/foundation.dart';

class GoodsItemDTO {
  final int id;
  final String name;
  final String description;
  final double price;

  GoodsItemDTO({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.price,
  })  : assert(id != null),
        assert(name != null),
        assert(price != null);

  GoodsItemDTO.fromJson(Map json)
      : this(
          id: json["id"],
          name: json["name"],
          description: json["description"],
          price: json["itemPrice"],
        );
}
