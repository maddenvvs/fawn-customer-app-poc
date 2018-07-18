import 'package:meta/meta.dart';

class OrderDTO {
  final int id;

  OrderDTO({
    @required this.id,
  }) : assert(id != null);

  OrderDTO.fromJson(Map json)
      : this(
          id: json["id"],
        );
}
