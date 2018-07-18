import 'package:meta/meta.dart';

class OrderStatusDTO {
  final int code;
  final String description;

  OrderStatusDTO({
    @required this.code,
    @required this.description,
  })  : assert(code != null),
        assert(description != null);

  OrderStatusDTO.fromJson(Map json)
      : this(
          code: json["code"],
          description: json["description"],
        );
}
